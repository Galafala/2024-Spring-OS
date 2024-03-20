#ifndef THREADS_H_
#define THREADS_H_
#define NULL_FUNC ((void (*)(int))-1)
// TODO: necessary includes, if any
#include "user/setjmp.h"
// TODO: necessary defines, if any

struct thread {
    void (*fp)(void *arg);
    void *arg;
    void *stack;
    void *stack_p;
    jmp_buf env; // for thread function
    int buf_set; // 1: indicate jmp_buf (env) has been set, 0: indicate jmp_buf (env) not set
    int ID;
    int executed;
    struct thread *previous;
    struct thread *next;
    
    // task part
    struct task *tasks;
    jmp_buf task_env; // for task function
    int task_buf_set; // 1: indicate jmp_buf (task_env) has been set, 0: indicate jmp_buf (task_env) not set
};

struct task{ // added
    void (*fp)(void *arg);
    void *arg;
    int executed;
    int yielded;
    struct task *previous;
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

struct task *task_create(void (*f)(void *), void *arg); // added
void push(struct thread *t, void (*f)(void *), void *arg); // added
void pop(); // added
#endif // THREADS_H_