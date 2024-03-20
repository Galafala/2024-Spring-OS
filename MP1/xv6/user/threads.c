#include "kernel/types.h"
#include "user/setjmp.h"
#include "user/threads.h"
#include "user/user.h"
#define NULL 0

static struct thread* current_thread = NULL;
static int id = 1;
static jmp_buf env_st;

struct thread *thread_create(void (*f)(void *), void *arg){
    struct thread *t = (struct thread*) malloc(sizeof(struct thread));
    unsigned long new_stack_p;
    unsigned long new_stack;
    new_stack = (unsigned long) malloc(sizeof(unsigned long)*0x100);
    new_stack_p = new_stack + 0x100*8-0x2*8;
    t->fp = f;
    t->arg = arg;
    t->buf_set = 0;
    t->ID  = id;
    t->stack = (void*) new_stack;
    t->stack_p = (void*) new_stack_p;
    t->executed = 0;

    t->tasks = NULL;
    id++;
    return t;
}
struct task *task_create(void (*f)(void *), void *arg){
    struct task *t = (struct task*) malloc(sizeof(struct task));
    t->fp = f;
    t->arg = arg;
    t->buf_set = 0;
    t->executed = 0;
    t->previous = NULL;
    return t;
}
void thread_add_runqueue(struct thread *t){
    if(current_thread == NULL){
        current_thread = t;
        current_thread->next = current_thread;
        current_thread->previous = current_thread;
    }
    else{
        struct thread *prevoius_thread = current_thread->previous;
        t->next = current_thread;
        t->previous = prevoius_thread;
        prevoius_thread->next = t;
        current_thread->previous = t;
    }
}
void thread_yield(void){
    //TODO 
    if (current_thread->tasks)
    {   
        if (current_thread->current_task->executed)
        {
            if (setjmp(current_thread->current_task->env) == 0)
            {
                schedule();
                dispatch();
            }
        }
        else
        {
            if (setjmp(current_thread->env) == 0)
            {
                schedule();
                dispatch();
            }
        }
    }
    else
    {
        if (setjmp(current_thread->env) == 0)
        {
            schedule();
            dispatch();
        }
    }
    
}
void dispatch(void){
    // TODO
    if (!current_thread->buf_set) // if the jmp_buf has been set
    {
        current_thread->buf_set = 1; // set the jmp_buf
        if (setjmp(current_thread->env) == 0)
        {
            current_thread->env->sp = (unsigned long)current_thread->stack_p; // set the stack pointer
            longjmp(current_thread->env, 1);
        }
    }
    if (current_thread->tasks && !current_thread->tasks->buf_set)
    { 
        current_thread->tasks->buf_set = 1;
        if (setjmp(current_thread->tasks->env) == 0)
        {   
            if (current_thread->current_task->executed)
            {   
                current_thread->tasks->env->sp = (unsigned long)current_thread->current_task->env->sp;
            }
            else
            {
                current_thread->tasks->env->sp = (unsigned long)current_thread->env->sp;
            }
            longjmp(current_thread->tasks->env, 1);
        }
        current_thread->current_task = current_thread->tasks;
    }
    if (current_thread->tasks && current_thread->current_task->buf_set)
    {   
        if (!current_thread->current_task->executed)
        {   
            current_thread->current_task->executed = 1;
            current_thread->current_task->fp(current_thread->current_task->arg); // task function
            pop();
            dispatch();
        }
        else
        {
            longjmp(current_thread->current_task->env, 1);
        }
    }
    else if (!current_thread->executed)
    {
        current_thread->executed = 1;
        current_thread->env->ra = (unsigned long)thread_exit;
        current_thread->fp(current_thread->arg); // thread function
        thread_exit();
    }
    else
    {
        longjmp(current_thread->env, 1);
    }
}
void schedule(void){
    current_thread = current_thread->next;
}
void thread_exit(void){
    if(current_thread->next != current_thread){
        struct thread *tmp = current_thread;
        struct thread *prevoius_thread = current_thread->previous;
        struct thread *next_thread = current_thread->next;

        prevoius_thread->next = next_thread;
        next_thread->previous = prevoius_thread;
        current_thread = next_thread;
        
        free(tmp->stack);
        free(tmp);

        dispatch();
    }
    else{
        free(current_thread->stack);
        free(current_thread);
        current_thread = NULL;

        longjmp(env_st, 1);
    }
}
void thread_start_threading(void){
    if (setjmp(env_st) == 0){
        dispatch();
    }    
}

// part 2
void thread_assign_task(struct thread *t, void (*f)(void *), void *arg){
    push(t, f, arg);
}
void push(struct thread *t, void (*f)(void *), void *arg){
    struct task *tmp = task_create(f, arg);
    if (t->tasks) {
        tmp->previous = t->tasks;
        t->tasks = tmp;
    }
    else{
        t->tasks = tmp;
        t->current_task = tmp;
    }
}
void pop(){
    struct task *tmp = current_thread->tasks;
    free(tmp);
    current_thread->tasks = current_thread->tasks->previous;
    current_thread->current_task = current_thread->tasks;
}