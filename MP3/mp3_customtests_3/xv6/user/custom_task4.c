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

// 15 threads arrive at the same time w different weights

int main(int argc, char **argv)
{
    for(int i=1;i<=12;i++){
        struct thread *t = thread_create(f, NULL, 0, 3, -1, 1);
        thread_set_weight(t, 1+i%4);
        thread_add_at(t, 5*i-2);
    }
    for(int i=13;i<=15;i++){
        struct thread *t = thread_create(f, NULL, 0, 64, -1, 1);
        thread_set_weight(t, 2);
        thread_add_at(t, 30*i-370);
    }
    thread_start_threading();
    printf("\nexited\n");
    exit(0);
}
