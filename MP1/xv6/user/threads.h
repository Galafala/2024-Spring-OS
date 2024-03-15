#ifndef THREADS_H_
#define THREADS_H_
#define NULL_FUNC ((void (*)(int))-1)
// TODO: necessary includes, if any
#include "user/setjmp.h"
// TODO: necessary defines, if any

#define task_num 128
struct thread {
    void (*fp)(void *arg);
    void *arg;
    void *stack;
    void *stack_p;
    jmp_buf env; // for thread function
    int buf_set; // 1: indicate jmp_buf (env) has been set, 0: indicate jmp_buf (env) not set
    int ID;
    struct thread *previous;
    struct thread *next;
    
    // task part
    jmp_buf task_envs[task_num]; // for task function
    jmp_buf task_return_envs[task_num]; // for task return
    int task_sets[task_num]; // 1: indicate jmp_buf (task_env) has been set, 0: indicate jmp_buf (task_env) not set
    void* tasks[task_num];
    void* task_args[task_num];
    int task_id;
};

struct thread *thread_create(void (*f)(void *), void *arg);
void thread_add_runqueue(struct thread *t);
void thread_yield(void);
void dispatch(void);
void schedule(void);
void thread_exit(void);
void thread_start_threading(void);

// part 2
void thread_assign_task(struct thread *t, void (*f)(void *), void *arg);

typedef struct{
    void (*fp)(void *arg);
    void *arg;
    jmp_buf env;
    int buf_set;
}task;

task *task_create(void (*f)(void *), void *arg);
void push(struct thread *t);
void pop(struct thread *t);
#endif // THREADS_H_