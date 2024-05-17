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
    int time=2;
    for(int i=1;i<=15;i++){
        struct thread *t = thread_create(f, NULL, 1,i,i,1);
        thread_add_at(t, time);
        time+=i+3;
    }
    thread_start_threading();
    printf("\nexited\n");
    exit(0);
}
