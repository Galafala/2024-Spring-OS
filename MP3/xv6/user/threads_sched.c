#include "kernel/types.h"
#include "user/user.h"
#include "user/list.h"
#include "user/threads.h"
#include "user/threads_sched.h"

#define NULL 0

/* default scheduling algorithm */
struct threads_sched_result schedule_default(struct threads_sched_args args)
{
    struct thread *thread_with_smallest_id = NULL;
    struct thread *th = NULL;
    list_for_each_entry(th, args.run_queue, thread_list) {
        if (thread_with_smallest_id == NULL || th->ID < thread_with_smallest_id->ID)
            thread_with_smallest_id = th;
    }

    struct threads_sched_result r;
    if (thread_with_smallest_id != NULL) {
        r.scheduled_thread_list_member = &thread_with_smallest_id->thread_list;
        r.allocated_time = thread_with_smallest_id->remaining_time;
    } else {
        r.scheduled_thread_list_member = args.run_queue;
        r.allocated_time = 1;
    }

    return r;
}

/* MP3 Part 1 - Non-Real-Time Scheduling */
/* Weighted-Round-Robin Scheduling */
struct threads_sched_result schedule_wrr(struct threads_sched_args args)
{   
    // TODO: implement the weighted round-robin scheduling algorithm
    struct thread *process_thread = NULL;
    struct thread *th = NULL;
    list_for_each_entry(th, args.run_queue, thread_list) {
        if (process_thread == NULL) {
            process_thread = th;
            break;
        }
    }

    struct threads_sched_result r;
    int time_quantum = args.time_quantum;
    if (process_thread != NULL) {
        r.scheduled_thread_list_member = &process_thread->thread_list;
        if (process_thread->remaining_time > time_quantum * (process_thread->weight)) {
            r.allocated_time = time_quantum * (process_thread->weight);
        }
        else {
            r.allocated_time = process_thread->remaining_time;
        }
    } else {
        r.scheduled_thread_list_member = args.run_queue;
        r.allocated_time = 1;
    }
    
    return r;
}

/* Shortest-Job-First Scheduling */
struct threads_sched_result schedule_sjf(struct threads_sched_args args)
{   
    // TODO: implement the shortest-job-first scheduling algorithm
    int current_time = args.current_time;

    // find the shortest thread in the run queue
    struct thread *shortest_thread = NULL;
    struct thread *th = NULL;
    list_for_each_entry(th, args.run_queue, thread_list) {
        if (shortest_thread == NULL || th->remaining_time < shortest_thread->remaining_time) {
            shortest_thread = th;
        }
    }

    // find the shortest thread in the release queue
    struct release_queue_entry *cur;
    int executing_time = shortest_thread->remaining_time;
    int reamining_time = shortest_thread->remaining_time;
    list_for_each_entry(cur, args.release_queue, thread_list) {
        if (current_time + reamining_time < cur->release_time) continue;
        int interval = cur->release_time - current_time;
        int remaining_time = reamining_time - interval;
        if (remaining_time > cur->thrd->processing_time && interval < executing_time) {
            executing_time = interval;
        }
        else if (remaining_time == cur->thrd->processing_time && interval < executing_time && shortest_thread->ID > cur->thrd->ID) {
            executing_time = interval;
        }
    }

    struct threads_sched_result r;
    if (shortest_thread != NULL) {
        r.scheduled_thread_list_member = &shortest_thread->thread_list;
        r.allocated_time = executing_time;
    }
    else {
        r.scheduled_thread_list_member = args.run_queue;
        r.allocated_time = 1;
    }

    return r;
}

/* MP3 Part 2 - Real-Time Scheduling*/
/* Least-Slack-Time Scheduling */
// struct threads_sched_result schedule_lst(struct threads_sched_args args)
// {
//     struct threads_sched_result r;
//     // TODO: implement the least-slack-time scheduling algorithm

//     return r;
// }

/* Deadline-Monotonic Scheduling */
// struct threads_sched_result schedule_dm(struct threads_sched_args args)
// {
//     struct threads_sched_result r;
//     // TODO: implement the deadline-monotonic scheduling algorithm

//     return r;
// }
