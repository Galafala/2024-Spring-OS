#include "kernel/types.h"
          #include "user/user.h"
          #include "user/threads.h"
          #define NULL 0
          int k = 0;
          void f(void *arg){
              while (1) k++;
          }
          int main(int argc, char **argv){
          struct thread *t1 = thread_create(f, NULL, 0, 28, -1, 1);
thread_set_weight(t1, 4);
thread_add_at(t1, 73);
struct thread *t2 = thread_create(f, NULL, 0, 38, -1, 1);
thread_set_weight(t2, 4);
thread_add_at(t2, 63);
struct thread *t3 = thread_create(f, NULL, 0, 1, -1, 1);
thread_set_weight(t3, 1);
thread_add_at(t3, 51);
struct thread *t4 = thread_create(f, NULL, 0, 58, -1, 1);
thread_set_weight(t4, 1);
thread_add_at(t4, 44);
struct thread *t5 = thread_create(f, NULL, 0, 55, -1, 1);
thread_set_weight(t5, 3);
thread_add_at(t5, 18);
struct thread *t6 = thread_create(f, NULL, 0, 36, -1, 1);
thread_set_weight(t6, 4);
thread_add_at(t6, 86);
struct thread *t7 = thread_create(f, NULL, 0, 42, -1, 1);
thread_set_weight(t7, 2);
thread_add_at(t7, 18);
struct thread *t8 = thread_create(f, NULL, 0, 40, -1, 1);
thread_set_weight(t8, 4);
thread_add_at(t8, 83);
struct thread *t9 = thread_create(f, NULL, 0, 22, -1, 1);
thread_set_weight(t9, 4);
thread_add_at(t9, 84);
struct thread *t10 = thread_create(f, NULL, 0, 36, -1, 1);
thread_set_weight(t10, 3);
thread_add_at(t10, 24);
struct thread *t11 = thread_create(f, NULL, 0, 20, -1, 1);
thread_set_weight(t11, 4);
thread_add_at(t11, 51);
struct thread *t12 = thread_create(f, NULL, 0, 7, -1, 1);
thread_set_weight(t12, 3);
thread_add_at(t12, 29);
struct thread *t13 = thread_create(f, NULL, 0, 18, -1, 1);
thread_set_weight(t13, 2);
thread_add_at(t13, 28);
struct thread *t14 = thread_create(f, NULL, 0, 14, -1, 1);
thread_set_weight(t14, 2);
thread_add_at(t14, 98);
struct thread *t15 = thread_create(f, NULL, 0, 4, -1, 1);
thread_set_weight(t15, 2);
thread_add_at(t15, 11);
thread_start_threading();
          printf("\nexited\n");
          exit(0);
          }