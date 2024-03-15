#include "kernel/types.h"
#include "user/user.h"
#include "user/threads.h"

#define NULL 0

void task4(void *arg)
{
    int i = *(int *) arg;
    printf("task 4: %d\n", i);

}

void task3(void *arg)
{
    int i = *(int *) arg;
    printf("task 3: %d\n", i);

}

void task2(void *arg)
{
    int i = *(int *) arg;
    printf("task 2: %d\n", i);

}

void f1(void *arg)
{
    int i = 100;

    while(1) {
        printf("thread 1: %d\n",i++);
        if (i == 106) {
            thread_exit();
        }
        thread_yield();
    }
}

int main(int argc, char **argv)
{
    printf("mp1-part2-0\n");
    struct thread *t1 = thread_create(f1, NULL);
    thread_add_runqueue(t1);
    printf("size of a function: %d\n", sizeof(void (*)(void *)));
    
    // int k = 1;
    // thread_assign_task(t1, task2, &k);
    // thread_assign_task(t1, task3, &k);
    // thread_assign_task(t1, task4, &k);

    thread_start_threading();
    printf("\nexited\n");
    exit(0);
}
