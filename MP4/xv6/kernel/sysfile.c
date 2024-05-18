//
// File-system system calls.
// Mostly argument checking, since we don't trust
// user code, and calls into file.c and fs.c.
//

#include "types.h"
#include "riscv.h"
#include "defs.h"
#include "param.h"
#include "stat.h"
#include "spinlock.h"
#include "proc.h"
#include "fs.h"
#include "sleeplock.h"
#include "file.h"
#include "fcntl.h"

void traverse_dir(struct inode *dp, char *target, char *userbuf, int bufsize, char *path);

// Fetch the nth word-sized system call argument as a file descriptor
// and return both the descriptor and the corresponding struct file.
static int
argfd(int n, int *pfd, struct file **pf)
{
  int fd;
  struct file *f;

  if(argint(n, &fd) < 0)
    return -1;
  if(fd < 0 || fd >= NOFILE || (f=myproc()->ofile[fd]) == 0)
    return -1;
  if(pfd)
    *pfd = fd;
  if(pf)
    *pf = f;
  return 0;
}

// Allocate a file descriptor for the given file.
// Takes over file reference from caller on success.
static int
fdalloc(struct file *f)
{
  int fd;
  struct proc *p = myproc();

  for(fd = 0; fd < NOFILE; fd++){
    if(p->ofile[fd] == 0){
      p->ofile[fd] = f;
      return fd;
    }
  }
  return -1;
}

uint64
sys_dup(void)
{
  struct file *f;
  int fd;

  if(argfd(0, 0, &f) < 0)
    return -1;
  if((fd=fdalloc(f)) < 0)
    return -1;
  filedup(f);
  return fd;
}

uint64
sys_read(void)
{
  struct file *f;
  int n;
  uint64 p;

  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argaddr(1, &p) < 0)
    return -1;
  return fileread(f, p, n);
}

uint64
sys_write(void)
{
  struct file *f;
  int n;
  uint64 p;

  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argaddr(1, &p) < 0)
    return -1;

  return filewrite(f, p, n);
}

uint64
sys_close(void)
{
  int fd;
  struct file *f;

  if(argfd(0, &fd, &f) < 0)
    return -1;
  myproc()->ofile[fd] = 0;
  fileclose(f);
  return 0;
}

uint64
sys_fstat(void)
{
  struct file *f;
  uint64 st; // user pointer to struct stat

  if(argfd(0, 0, &f) < 0 || argaddr(1, &st) < 0)
    return -1;
  return filestat(f, st);
}

// Create the path new as a link to the same inode as old.
uint64
sys_link(void)
{
  char name[DIRSIZ], new[MAXPATH], old[MAXPATH];
  struct inode *dp, *ip;

  if(argstr(0, old, MAXPATH) < 0 || argstr(1, new, MAXPATH) < 0)
    return -1;

  begin_op();
  if((ip = namei(old)) == 0){
    end_op();
    return -1;
  }

  ilock(ip);
  if(ip->type == T_DIR){
    iunlockput(ip);
    end_op();
    return -1;
  }

  ip->nlink++;
  iupdate(ip);
  iunlock(ip);

  if((dp = nameiparent(new, name)) == 0)
    goto bad;
  ilock(dp);
  if(dp->dev != ip->dev || dirlink(dp, name, ip->inum) < 0){
    iunlockput(dp);
    goto bad;
  }
  iunlockput(dp);
  iput(ip);

  end_op();

  return 0;

bad:
  ilock(ip);
  ip->nlink--;
  iupdate(ip);
  iunlockput(ip);
  end_op();
  return -1;
}

// Is the directory dp empty except for "." and ".." ?
static int
isdirempty(struct inode *dp)
{
  int off;
  struct dirent de;

  for(off=2*sizeof(de); off<dp->size; off+=sizeof(de)){
    if(readi(dp, 0, (uint64)&de, off, sizeof(de)) != sizeof(de))
      panic("isdirempty: readi");
    if(de.inum != 0)
      return 0;
  }
  return 1;
}

uint64
sys_unlink(void)
{
  struct inode *ip, *dp;
  struct dirent de;
  char name[DIRSIZ], path[MAXPATH];
  uint off;

  if(argstr(0, path, MAXPATH) < 0)
    return -1;

  begin_op();
  if((dp = nameiparent(path, name)) == 0){
    end_op();
    return -1;
  }

  ilock(dp);

  // Cannot unlink "." or "..".
  if(namecmp(name, ".") == 0 || namecmp(name, "..") == 0)
    goto bad;

  if((ip = dirlookup(dp, name, &off)) == 0)
    goto bad;
  ilock(ip);

  if(ip->nlink < 1)
    panic("unlink: nlink < 1");
  if(ip->type == T_DIR && !isdirempty(ip)){
    iunlockput(ip);
    goto bad;
  }

  memset(&de, 0, sizeof(de));
  if(writei(dp, 0, (uint64)&de, off, sizeof(de)) != sizeof(de))
    panic("unlink: writei");
  if(ip->type == T_DIR){
    dp->nlink--;
    iupdate(dp);
  }
  iunlockput(dp);

  ip->nlink--;
  iupdate(ip);
  iunlockput(ip);

  end_op();

  return 0;

bad:
  iunlockput(dp);
  end_op();
  return -1;
}

static struct inode*
create(char *path, short type, short major, short minor)
{
  struct inode *ip, *dp;
  char name[DIRSIZ];

  if((dp = nameiparent(path, name)) == 0)
    return 0;

  ilock(dp);

  if((ip = dirlookup(dp, name, 0)) != 0){
    iunlockput(dp);
    ilock(ip);
    if(type == T_FILE && (ip->type == T_FILE || ip->type == T_DEVICE))
      return ip;
    iunlockput(ip);
    return 0;
  }

  if((ip = ialloc(dp->dev, type)) == 0)
    panic("create: ialloc");

  ilock(ip);
  ip->major = major;
  ip->minor = minor;
  ip->nlink = 1;
  iupdate(ip);

  if(type == T_DIR){  // Create . and .. entries.
    dp->nlink++;  // for ".."
    iupdate(dp);
    // No ip->nlink++ for ".": avoid cyclic ref count.
    if(dirlink(ip, ".", ip->inum) < 0 || dirlink(ip, "..", dp->inum) < 0)
      panic("create dots");
  }

  if(dirlink(dp, name, ip->inum) < 0)
    panic("create: dirlink");

  iunlockput(dp);

  return ip;
}

uint64
sys_open(void)
{
  // TODO: Symbolic links to Files
  // open() should handle symbolic link
  // If the file is a symbolic link, and O_NOFOLLOW is not specified,
  // then you should read the path in the symbolic link,
  // and return the corresponding file.

  char path[MAXPATH];
  char symlink_path[MAXPATH];
  int depth;
  int fd, omode;
  struct file *f;
  struct inode *ip;
  int n;

  if((n = argstr(0, path, MAXPATH)) < 0 || argint(1, &omode) < 0)
    return -1;

  begin_op();


  for (depth = 0; depth < 20; depth++){
    if(omode & O_CREATE){
      ip = create(path, T_FILE, 0, 0); // The file is created if it does not exist
      if(ip == 0){
        end_op();
        return -1;
      }
    } else {
      if((ip = namei(path)) == 0){ // look up the inode of the file with the given path
        end_op();
        return -1;
      }
      ilock(ip);
      if (ip->type == T_SYMLINK && !(omode & O_NOFOLLOW)) {
        // Read the symlink target
        if (readi(ip, 0, (uint64)symlink_path, 0, MAXPATH) < 0 || depth == 19) {
          iunlockput(ip);
          end_op();
          return -1;
        }
        symlink_path[MAXPATH-1] = '\0'; // Ensure null-terminated string
        strncpy(path, symlink_path, MAXPATH); // Copy symlink path to path
        iunlockput(ip);
        continue; // Continue to follow the next symlink
      }
      if(ip->type == T_DIR && omode != O_RDONLY){ // The file is a directory and it is not opened for read only
        iunlockput(ip);
        end_op();
        return -1;
      }
    }
    break;
  }

  if(ip->type == T_DEVICE && (ip->major < 0 || ip->major >= NDEV)){
    iunlockput(ip);
    end_op();
    return -1;
  }

  if((f = filealloc()) == 0 || (fd = fdalloc(f)) < 0){
    if(f)
      fileclose(f);
    iunlockput(ip);
    end_op();
    return -1;
  }

  if(ip->type == T_DEVICE){
    f->type = FD_DEVICE;
    f->major = ip->major;
  } else {
    f->type = FD_INODE;
    f->off = 0;
  }
  f->ip = ip;
  f->readable = !(omode & O_WRONLY);
  f->writable = (omode & O_WRONLY) || (omode & O_RDWR);

  if((omode & O_TRUNC) && ip->type == T_FILE){
    itrunc(ip);
  }

  iunlock(ip);
  end_op();

  return fd;
}

uint64
sys_mkdir(void)
{
  char path[MAXPATH];
  struct inode *ip;

  begin_op();
  if(argstr(0, path, MAXPATH) < 0 || (ip = create(path, T_DIR, 0, 0)) == 0){
    end_op();
    return -1;
  }
  iunlockput(ip);
  end_op();
  return 0;
}

uint64
sys_mknod(void)
{
  struct inode *ip;
  char path[MAXPATH];
  int major, minor;

  begin_op();
  if((argstr(0, path, MAXPATH)) < 0 ||
     argint(1, &major) < 0 ||
     argint(2, &minor) < 0 ||
     (ip = create(path, T_DEVICE, major, minor)) == 0){
    end_op();
    return -1;
  }
  iunlockput(ip);
  end_op();
  return 0;
}

uint64
sys_chdir(void)
{
  char path[MAXPATH];
  struct inode *ip;
  struct proc *p = myproc();
  
  begin_op();
  if(argstr(0, path, MAXPATH) < 0 || (ip = namei(path)) == 0){
    end_op();
    return -1;
  }
  ilock(ip);
  if(ip->type != T_DIR){
    iunlockput(ip);
    end_op();
    return -1;
  }
  iunlock(ip);
  iput(p->cwd);
  end_op();
  p->cwd = ip;
  return 0;
}

uint64
sys_exec(void)
{
  char path[MAXPATH], *argv[MAXARG];
  int i;
  uint64 uargv, uarg;

  if(argstr(0, path, MAXPATH) < 0 || argaddr(1, &uargv) < 0){
    return -1;
  }
  memset(argv, 0, sizeof(argv));
  for(i=0;; i++){
    if(i >= NELEM(argv)){
      goto bad;
    }
    if(fetchaddr(uargv+sizeof(uint64)*i, (uint64*)&uarg) < 0){
      goto bad;
    }
    if(uarg == 0){
      argv[i] = 0;
      break;
    }
    argv[i] = kalloc();
    if(argv[i] == 0)
      goto bad;
    if(fetchstr(uarg, argv[i], PGSIZE) < 0)
      goto bad;
  }

  int ret = exec(path, argv);

  for(i = 0; i < NELEM(argv) && argv[i] != 0; i++)
    kfree(argv[i]);

  return ret;

 bad:
  for(i = 0; i < NELEM(argv) && argv[i] != 0; i++)
    kfree(argv[i]);
  return -1;
}

uint64
sys_pipe(void)
{
  uint64 fdarray; // user pointer to array of two integers
  struct file *rf, *wf;
  int fd0, fd1;
  struct proc *p = myproc();

  if(argaddr(0, &fdarray) < 0)
    return -1;
  if(pipealloc(&rf, &wf) < 0)
    return -1;
  fd0 = -1;
  if((fd0 = fdalloc(rf)) < 0 || (fd1 = fdalloc(wf)) < 0){
    if(fd0 >= 0)
      p->ofile[fd0] = 0;
    fileclose(rf);
    fileclose(wf);
    return -1;
  }
  if(copyout(p->pagetable, fdarray, (char*)&fd0, sizeof(fd0)) < 0 ||
     copyout(p->pagetable, fdarray+sizeof(fd0), (char *)&fd1, sizeof(fd1)) < 0){
    p->ofile[fd0] = 0;
    p->ofile[fd1] = 0;
    fileclose(rf);
    fileclose(wf);
    return -1;
  }
  return 0;
}

uint64
sys_symlink(void)
{
  // TODO: symbolic link
  // You should implement this symlink system call.
  char target[MAXPATH], path[MAXPATH];
  struct inode *ip;

  if(argstr(0, target, MAXPATH) < 0 || argstr(1, path, MAXPATH) < 0)
    return -1;
  
  begin_op();

  if((ip = create(path, T_SYMLINK, 0, 0)) == 0){
    end_op();
    return -1;
  }

  // write the target path to the inode data field
  // ilock(ip);
  if(writei(ip, 0, (uint64)target, 0, strlen(target)) != strlen(target)){
    iunlockput(ip);
    end_op();
    return -1;
  }

  iunlockput(ip);
  end_op();

  return 0;
}

uint64
sys_revreadlink(void) 
{
  // TODO: Find all symbolic links that point to 'target'
  /*
  buf: A user-space buffer where the paths of the symbolic links will be stored. 
  You must implement the functionality to write the resulting symbolic link paths directly into this buf.
  The buf should be managed carefully to handle string operations efficiently:
  •No leading whitespace at the beginning of the buf.
  •A single space must separate each path; ensure only one space is used.
  •No need of any trailing characters, spaces after the final path.
  •All paths must be absolute paths, beginning from the root directory (start with /).
  •If there are multiple paths, the order of these paths in the buffer can vary.
  */
  char target[MAXPATH];
  uint64 bufaddr;
  int bufsize;

  if(argstr(0, target, MAXPATH) < 0 || argaddr(1, &bufaddr) < 0 || argint(2, &bufsize) < 0)
    return -1;

  char userbuf[bufsize];
  memset(userbuf, 0, sizeof(userbuf));

  // implement the code to find all symbolic links that point to 'target'
  begin_op();

  struct inode *dp;
  dp = namei("/");
  traverse_dir(dp, target, userbuf, bufsize, "/");
  
  end_op();

  // Copy the result from kernel to user space, userbuf should store all symbolic links that point to 'target'
  if(copyout(myproc()->pagetable, bufaddr, userbuf, strlen(userbuf)) < 0)
    return -1;

  // Return the number of bytes written to user buffer
  return strlen(userbuf);
}

void
traverse_dir(struct inode *dp, char *target, char *userbuf, int bufsize, char *path)
{ 
  struct dirent de;
  struct inode *ip;
  char newpath[MAXPATH] = "";

  ilock(dp);

  for(int i = 0; i < dp->size; i += sizeof(de)){
    if(readi(dp, 0, (uint64)&de, i, sizeof(de)) != sizeof(de)) // read the directory entry
      continue;
    if(de.inum == 0) // skip empty directory entries
      continue;
    if(strncmp(de.name, ".", DIRSIZ) == 0 || strncmp(de.name, "..", DIRSIZ) == 0) // skip "." and ".."
      continue;
    if((ip = iget(dp->dev, de.inum)) == 0) // get the inode of the file
      continue;

    if (strlen(path) + strlen(de.name) + 1 >= MAXPATH) {
      iunlock(ip);
      continue;
    }
    
    strncpy(newpath, path, MAXPATH);
    if (strncmp(path, "/", strlen(path)) != 0)
      strcat(newpath, "/");
    strcat(newpath, de.name);
    ilock(ip);    

    if(ip->type == T_SYMLINK){
      char link[MAXPATH];
      memset(link, 0, sizeof(link));
      if(readi(ip, 0, (uint64)link, 0, MAXPATH) < 0){
        iunlock(ip);
        continue;
      }
      if(strncmp(link, target, strlen(link)) == 0){
        if(strlen(userbuf) > 0)
              strcat(userbuf, " ");
        strcat(userbuf, newpath);      
      }
      iunlock(ip);
    } 
    else if(ip->type == T_DIR){
      iunlock(ip);
      traverse_dir(ip, target, userbuf, bufsize, newpath);
    }
    else{
      iunlock(ip);
    }
  }

  iunlockput(dp);
  return;
}
