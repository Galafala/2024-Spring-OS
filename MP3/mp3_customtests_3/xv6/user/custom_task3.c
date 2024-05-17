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

// 15 threads

int main(int argc, char **argv)
{
    for(int i=1;i<=15;i++){
        struct thread *t = thread_create(f, NULL, 0, 64-i*4, -1, 1);
        thread_set_weight(t, 4-i%4);
        thread_add_at(t, i*2);
    }
    thread_start_threading();
    printf("\nexited\n");
    exit(0);
}
