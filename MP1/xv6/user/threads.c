#include "kernel/types.h"
#include "user/setjmp.h"
#include "user/threads.h"
#include "user/user.h"
#define NULL 0

static struct thread* current_thread = NULL;
static int id = 1;
static jmp_buf env_st;
static jmp_buf env_tmp;

struct thread *thread_create(void (*f)(void *), void *arg){
    struct thread *t = (struct thread*) malloc(sizeof(struct thread));
    unsigned long new_stack_p;
    unsigned long new_stack;
    new_stack = (unsigned long) malloc(sizeof(unsigned long)*0x100);
    new_stack_p = new_stack + 0x100*8-0x2*8;
    t->fp = f;
    t->arg = arg;
    t->ID  = id;
    t->buf_set = 0;
    t->stack = (void*) new_stack;
    t->stack_p = (void*) new_stack_p;

    t->task_id = 0;
    memset(t->task_sets, 0, sizeof(t->task_sets));
    id++;
    return t;
}
void thread_add_runqueue(struct thread *t){
    if(current_thread == NULL){
        // TODO
        current_thread = t;
        current_thread->next = current_thread;
        current_thread->previous = current_thread;
    }
    else{
        // TODO
        struct thread *prevoius_thread = current_thread->previous;
        t->next = current_thread;
        t->previous = prevoius_thread;
        prevoius_thread->next = t;
        current_thread->previous = t;
    }
}
void thread_yield(void){
    //TODO
    if (current_thread->task_id){
        if (setjmp(current_thread->task_envs[current_thread->task_id]) == 0){ 
            schedule(); // schedule the next thread
            if (setjmp(current_thread->task_envs[current_thread->task_id]) == 0){ // if the current thread has task
                if (current_thread->task_id){
                    dispatch();
                } 
            }
            else{
                pop(current_thread);
            }
            dispatch(); // dispatch the thread
        }      
    }
    else{
        if (setjmp(current_thread->env) == 0){ 
            schedule(); // schedule the next thread
            if (setjmp(current_thread->task_envs[current_thread->task_id]) == 0){ // if the current thread has task
                if (current_thread->task_id){
                    dispatch();
                } 
            }
            else{
                pop(current_thread);
            }
            dispatch(); // dispatch the thread
        }
    }
}
void dispatch(void){
    // TODO
    if (current_thread->task_id){
        int current_task_id = current_thread->task_id;
        if (current_thread->task_sets[current_task_id]){ // if the task has been set
            current_thread->stack_p = (void*)current_thread->task_envs[current_task_id]->sp;
            longjmp(current_thread->task_envs[current_task_id], 1);
        }

        current_thread->task_sets[current_task_id] = 1; // set the task
        if (setjmp(env_tmp) == 0){
            env_tmp->sp = (unsigned long)current_thread->stack_p; // set the stack pointer
            longjmp(env_tmp, 1);
        }
        else{
            current_thread->task_envs[current_task_id]->sp = env_tmp->sp;
            void (*task)(void *) = current_thread->tasks[current_task_id];
            void *task_arg = current_thread->task_args[current_task_id];
            task(task_arg);
        }
        longjmp(current_thread->task_envs[current_task_id], 1);
    }

    if (current_thread->buf_set){ // if the jmp_buf has been set
        current_thread->stack_p = (void*)current_thread->env->sp;
        longjmp(current_thread->env, 1);
    }

    current_thread->buf_set = 1; // set the jmp_buf
    if (setjmp(env_tmp) == 0){
        env_tmp->sp = (unsigned long)current_thread->stack_p; // set the stack pointer
        longjmp(env_tmp, 1);
    }
    else {
        current_thread->env->sp = env_tmp->sp;
        current_thread->fp(current_thread->arg);
    }
    thread_exit();
}
void schedule(void){
    // TODO
    current_thread = current_thread->next;
}
void thread_exit(void){
    if(current_thread->next != current_thread){
        // TODO
        struct thread *tmp = current_thread;
        struct thread *prevoius_thread = current_thread->previous;
        struct thread *next_thread = current_thread->next;

        prevoius_thread->next = next_thread;
        next_thread->previous = prevoius_thread;
        current_thread = next_thread;
        
        free(tmp->stack);
        free(tmp);

        if (current_thread->task_id){
            current_thread->stack_p = (void*)current_thread->task_envs[current_thread->task_id]->sp;
            longjmp(current_thread->task_envs[current_thread->task_id], 1);
        }
        else{
            current_thread->stack_p = (void*)current_thread->env->sp;
            longjmp(current_thread->env, 1); // jump to next thread
        }     
    }
    else{
        // TODO
        // Hint: No more thread to execute
        free(current_thread->stack);
        free(current_thread);
        current_thread = NULL;
        longjmp(env_st, 1);
    }
}
void thread_start_threading(void){
    // TODO
    if (setjmp(env_st) == 0){
        dispatch();
    }    
}

// part 2
void thread_assign_task(struct thread *t, void (*f)(void *), void *arg){
    // TODO
    push(t);
    t->tasks[t->task_id] = f;
    t->task_args[t->task_id] = arg; 
}

void push(struct thread *t) {
    // printf("Thread%d pushing\n", t->ID);
    t->stack_p -= 0x2*8;
    t->task_id++;
}

void pop(struct thread *t) {
    // printf("Thread%d popping\n", t->ID);
    t->stack_p += 0x2*8;
    t->task_sets[t->task_id] = 0;
    t->task_id--;
}