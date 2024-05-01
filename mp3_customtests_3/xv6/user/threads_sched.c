#include "kernel/types.h"
#include "user/user.h"
#include "user/list.h"
#include "user/threads.h"
#include "user/threads_sched.h"

#define NULL 0

struct threads_sched_result fill_sparse(struct threads_sched_args args) {
    int sleep_time = -1;
    struct release_queue_entry *cur;
    list_for_each_entry(cur, args.release_queue, thread_list) {
        if (sleep_time < 0 || sleep_time > cur->release_time - args.current_time)
            sleep_time = cur->release_time - args.current_time;
    }
    return (struct threads_sched_result) { .scheduled_thread_list_member = args.run_queue, .allocated_time = sleep_time };
}

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
    if (list_empty(args.run_queue)) 
        return fill_sparse(args);

    struct thread *process_thread = NULL;
    struct thread *th = NULL;
    list_for_each_entry(th, args.run_queue, thread_list) {
        if (process_thread == NULL) {
            process_thread = th;
            break;
        }
    }
    
    int time_quantum = args.time_quantum;
    int executing_time = process_thread->remaining_time;
    if (process_thread->remaining_time > time_quantum * (process_thread->weight)) {
        executing_time = time_quantum * (process_thread->weight);
    }
    else {
        executing_time = process_thread->remaining_time;
    }
    
    return (struct threads_sched_result) { .scheduled_thread_list_member = &process_thread->thread_list, .allocated_time = executing_time };
}

/* Shortest-Job-First Scheduling */
struct threads_sched_result schedule_sjf(struct threads_sched_args args)
{   
    // TODO: implement the shortest-job-first scheduling algorithm
    if (list_empty(args.run_queue)) 
        return fill_sparse(args);

    int current_time = args.current_time;

    // find the shortest thread in the run queue
    struct thread *shortest_thread = NULL;
    struct thread *th = NULL;
    list_for_each_entry(th, args.run_queue, thread_list) {
        if (shortest_thread == NULL || th->remaining_time < shortest_thread->remaining_time) {
            shortest_thread = th;
        }
        else if (th->remaining_time == shortest_thread->remaining_time && th->ID < shortest_thread->ID) {
            shortest_thread = th;
        }
    }

    struct release_queue_entry *cur;
    int executing_time = shortest_thread->remaining_time;
    list_for_each_entry(cur, args.release_queue, thread_list) {
        int interval = cur->release_time - current_time;
        if (interval > executing_time) continue;
        if (current_time + shortest_thread->remaining_time < cur->release_time || interval > executing_time) continue; 
        int remaining_time = shortest_thread->remaining_time - interval;
        if (remaining_time < cur->thrd->processing_time) continue;
        if (remaining_time == cur->thrd->processing_time && shortest_thread->ID < cur->thrd->ID) continue;
        executing_time = interval;
    }

    return (struct threads_sched_result) { .scheduled_thread_list_member = &shortest_thread->thread_list, .allocated_time = executing_time };
}

/* MP3 Part 2 - Real-Time Scheduling*/
/* Least-Slack-Time Scheduling */
struct threads_sched_result schedule_lst(struct threads_sched_args args)
{
    // TODO: implement the least-slack-time scheduling algorithm
    // A slack time is defined by current deadline − current time − remaining time
    
    // no thread in the run queue
    if (list_empty(args.run_queue)) 
        return fill_sparse(args);

    int current_time = args.current_time;

    // find the thread with the least slack time
    struct thread *least_slack_thread = NULL;
    struct thread *th = NULL;
    list_for_each_entry(th, args.run_queue, thread_list) {
        int slack_time = th->current_deadline - current_time - th->remaining_time;
        if (th->current_deadline < current_time) continue;
        int least_slack_time = (least_slack_thread == NULL) ? 0 : least_slack_thread->current_deadline - current_time - least_slack_thread->remaining_time;
        if (least_slack_thread == NULL || slack_time < least_slack_time) {
            least_slack_thread = th;
        }
        else if (slack_time == least_slack_time && th->ID < least_slack_thread->ID) {
            least_slack_thread = th;
        }
    }

    // all thread missing the current deadline
    if (least_slack_thread == NULL) {
        list_for_each_entry(th, args.run_queue, thread_list) {
            if (least_slack_thread == NULL || th->ID < least_slack_thread->ID)
                least_slack_thread = th;
        }
        return (struct threads_sched_result) { .scheduled_thread_list_member = &least_slack_thread->thread_list, .allocated_time = 0 };
    }
    
    // missing the deadline but still have some time to execute part of the task
    if (least_slack_thread->remaining_time > least_slack_thread->current_deadline - current_time) 
        return (struct threads_sched_result) { .scheduled_thread_list_member = &least_slack_thread->thread_list, .allocated_time = least_slack_thread->current_deadline - current_time };
    
    struct release_queue_entry *cur;
    int slack_time = least_slack_thread->current_deadline - current_time - least_slack_thread->remaining_time;
    int executing_time = least_slack_thread->remaining_time;
    list_for_each_entry(cur, args.release_queue, thread_list) {
        int cur_slack_time = cur->thrd->deadline - cur->thrd->processing_time;
        int interval = cur->release_time - current_time;
        if (interval > executing_time || slack_time < cur_slack_time) continue;
        if (slack_time == cur_slack_time && least_slack_thread->ID < cur->thrd->ID) continue;
        executing_time = interval;
    }
    return (struct threads_sched_result) { .scheduled_thread_list_member = &least_slack_thread->thread_list, .allocated_time = executing_time };
}

/* Deadline-Monotonic Scheduling */
struct threads_sched_result schedule_dm(struct threads_sched_args args)
{
    // TODO: implement the deadline-monotonic scheduling algorithm
    // Task with shortest deadline is assigned highest priority.
    int current_time = args.current_time;

    struct thread *highest_priority_thread = NULL;
    struct thread *th = NULL;
    list_for_each_entry(th, args.run_queue, thread_list) {
        if (highest_priority_thread == NULL || th->deadline < highest_priority_thread->deadline) {
            highest_priority_thread = th;
        }
        else if (th->deadline == highest_priority_thread->deadline && th->ID < highest_priority_thread->ID) {
            highest_priority_thread = th;
        }
    }
    
    // no thread in the run queue
    if (highest_priority_thread == NULL) 
        return fill_sparse(args);
    
    // missing the deadline
    if (highest_priority_thread->remaining_time > highest_priority_thread->current_deadline - current_time) 
        return (struct threads_sched_result) { .scheduled_thread_list_member = &highest_priority_thread->thread_list, .allocated_time = 0 };
    
    struct release_queue_entry *cur;
    int executing_time = highest_priority_thread->remaining_time;
    list_for_each_entry(cur, args.release_queue, thread_list) {
        int interval = cur->release_time - current_time;
        if (interval > executing_time) continue;
        if (highest_priority_thread->deadline > cur->thrd->deadline) {
            executing_time = interval;
        }
        else if (highest_priority_thread->deadline == cur->thrd->deadline && highest_priority_thread->ID > cur->thrd->ID) {
            executing_time = interval;
        }
    }
    
    return (struct threads_sched_result) { .scheduled_thread_list_member = &highest_priority_thread->thread_list, .allocated_time = executing_time };
}
