#include "kernel/types.h"
#include "user/user.h"
#include "user/threads.h"

#define NULL 0

int k = 0;

void f(void *arg)
{
    while (1) {
        k++;
    }
}

// 15 threads arriving @ different times w same deadline

int main(int argc, char **argv)
{   
    struct thread *t0 = thread_create(f, NULL, 1,64,64,1);
    thread_add_at(t0, 0);
    for(int i=2;i<=15;i++){
        struct thread *t = thread_create(f, NULL, 1,1,2,10);
        thread_add_at(t, 50-i*2);
    }
    thread_start_threading();
    printf("\nexited\n");
    exit(0);
}
