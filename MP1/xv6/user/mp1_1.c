#include "kernel/types.h"
#include "user/threads.h"
#include "user/user.h"

#define NULL 0

#define TASK_COUNT 2

static struct thread *thread1;
static struct thread *thread2;
void task1(void* arg){
    printf("task added\n");
    int randomvar = 10;
    randomvar++;
    thread_yield();
    printf("task finished\n");
    return;
}
void t1(void* arg){
    printf("t1 executed and returned\n");
}
void t2(void* arg){
    for(int i = 0; i < TASK_COUNT; ++i){
        thread_assign_task(thread1, task1, NULL);
        thread_yield();
    }
    printf("t2 end\n");
}


int main(int argc, char **argv) {
    printf("function execution test\n");
    thread1 = thread_create(t1, NULL);
    thread2 = thread_create(t2, NULL);
    thread_add_runqueue(thread2);
    thread_add_runqueue(thread1);
    thread_start_threading();

    printf("\nexited\n");
    exit(0);
}
