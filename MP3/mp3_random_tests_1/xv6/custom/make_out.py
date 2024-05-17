import copy

"""owo"""

def read_tasks(filename):
    tasks = []
    with open(filename, 'r') as file:
        t = int(file.readline().strip())  # Read the number of tasks
        for i in range(t):
            line = file.readline().strip().split()
            task = {
                'id': i + 1,
                'is_real_time': int(line[0]),
                'processing_time': int(line[1]),
                'period': int(line[2]),
                'n': int(line[3]),
                'weight': int(line[4]),
                'arrival_time': int(line[5])
            }
            tasks.append(task)
    return tasks

def weighted_round_robin(t):
    time = 0
    outputs = []
    quantum = 2
    run_queue = []
    tasks=copy.deepcopy(t)
    def update_queue():
        for task in [t for t in tasks if (t['arrival_time'] <= time)]:
            tasks.remove(task)
            run_queue.append(task)
    while tasks or run_queue:
        update_queue()
        
        if not run_queue:
            if tasks:
                sleep_time = min([t['arrival_time'] for t in tasks]) - time
                outputs.append(f"run_queue is empty, sleep for {sleep_time} ticks")
                time += sleep_time
                update_queue()
            continue
        
        task = run_queue.pop(0)

        exec_time = min(task['weight'] * quantum, task['processing_time'])
        outputs.append(f"dispatch thread#{task['id']} at {time}: allocated_time={exec_time}")
        task['processing_time'] -= exec_time
        time+=exec_time
        update_queue()
        if task['processing_time']==0:
            outputs.append(f"thread#{task['id']} finish at {time}")
        else:
            run_queue.append(task)  # Re-queue if still has remaining processing time

    return outputs

def shortest_job_first(t):
    tasks=copy.deepcopy(t)
    tasks.sort(key=lambda x: (x['arrival_time'],x['id']))  # Sort tasks by arrival time
    time = 0
    outputs = []
    run_queue = []
    def update_queue():
        while tasks and (tasks[0]['arrival_time'] <= time):
            task = tasks.pop(0)
            run_queue.append(task)
    while tasks or run_queue:
        update_queue()
        # If no tasks are ready to run, jump forward in time
        if not run_queue:
            if tasks:
                sleep_time = tasks[0]['arrival_time'] - time
                outputs.append(f"run_queue is empty, sleep for {sleep_time} ticks")
                time += sleep_time
                update_queue()
            continue
        
        # Select the task with the shortest processing time
        run_queue.sort(key=lambda x: (x['processing_time'],x['id']))
        task = run_queue.pop(0)
        exec_time=task['processing_time']
        for task2come in tasks:
            if ((task['processing_time']+time),task['id'])>((task2come['processing_time']+task2come['arrival_time']),task2come['id']):
                exec_time=min(exec_time,task2come['arrival_time']-time)
        # Execute the task
        outputs.append(f"dispatch thread#{task['id']} at {time}: allocated_time={exec_time}")
        task['processing_time'] -= exec_time
        time+=exec_time
        update_queue()
        if task['processing_time']==0:
            outputs.append(f"thread#{task['id']} finish at {time}")
        else:
            run_queue.append(task)  # Re-queue if still has remaining processing time

    return outputs

def least_slack_time(t):
    time = 0
    outputs = []
    tasks=copy.deepcopy(t)
    tasks.sort(key=lambda x: (x['arrival_time'],x['id']))  # Sort tasks by arrival time
    time = 0
    outputs = []
    run_queue = []
    def update_queue():
        tasks.sort(key=lambda x: (x['arrival_time'],x['id']))  # Sort tasks by arrival time
        while tasks and (tasks[0]['arrival_time'] <= time):
            task = tasks.pop(0)
            run_queue.append(task)
            task['n']-=1
            new_task=copy.deepcopy(task)
            new_task['arrival_time']+=new_task['period']
            if new_task['n']>0:
                tasks.append(new_task)
                tasks.sort(key=lambda x: (x['arrival_time'],x['id']))
        run_queue.sort(key=priority)
    def cal_lst(x):
        return (x['arrival_time']+x['period']-time-x['processing_time'])
    def priority(x):
        return (cal_lst(x),(x['id']))
    def new_priority(x):
        return ((x['period']-x['processing_time']),(x['id']))
    def first_miss(run_queue):
        minid=100
        mintask=None
        for task in run_queue:
            if time>=task['arrival_time']+task['period'] and task['id']<minid:
                minid=task['id']
                mintask=task
        return mintask  
    while tasks or run_queue:
        update_queue()
        if not run_queue:
            sleep_time = tasks[0]['arrival_time'] - time
            outputs.append(f"run_queue is empty, sleep for {sleep_time} ticks")
            time += sleep_time
            update_queue()
            continue
        miss=first_miss(run_queue)
        if miss!=None:
            outputs.append(f"thread#{miss['id']} misses a deadline at {miss['arrival_time'] + miss['period']}")
            return outputs
        
        task=run_queue.pop(0)
        start=time
        end=time+task['processing_time']
        end=min(end,task['arrival_time']+task['period'])
        lst=priority(task)
        for task2come in tasks:
            if new_priority(task2come) < lst:
                end=min(end,task2come['arrival_time'])
        exec_time=end-start
        if exec_time<=0:
            outputs.append(f"thread#{task['id']} misses a deadline at {task['arrival_time']+task['period']}")
            return outputs
        else:
            outputs.append(f"dispatch thread#{task['id']} at {time}: allocated_time={exec_time}")
        task['processing_time']-=exec_time
        time+=exec_time
        update_queue()
        if task['processing_time']==0:
            outputs.append(f"thread#{task['id']} finish one cycle at {time}: {task['n']} cycles left")
        elif time==task['arrival_time']+task['period']:
            outputs.append(f"thread#{task['id']} misses a deadline at {task['arrival_time']+task['period']}")
            return outputs
        else:
            run_queue.append(task)  # Re-queue if still has remaining processing time

    return outputs

def rate_monotonic_scheduling(t):
    # Initialize the simulation
    time = 0
    outputs = []
    run_queue = []
    tasks=copy.deepcopy(t)
    tasks.sort(key=lambda x: (x['arrival_time'], x['id']))  # Sort tasks by arrival time and then by period

    # Function to update the ready queue
    def update_queue():
        tasks.sort(key=lambda x: (x['arrival_time'],x['id']))  # Sort tasks by arrival time
        while tasks and (tasks[0]['arrival_time'] <= time):
            task = tasks.pop(0)
            run_queue.append(task)
            task['n']-=1
            new_task=copy.deepcopy(task)
            new_task['arrival_time']+=new_task['period']
            if new_task['n']>0:
                tasks.append(new_task)
                tasks.sort(key=lambda x: (x['arrival_time'],x['id']))
        run_queue.sort(key=priority)
    def priority(x):
        return (x['period'],x['id'])
    # Simulation loop
    def first_miss(run_queue):
        minid=100
        mintask=None
        for task in run_queue:
            if time>=task['arrival_time']+task['period'] and task['id']<minid:
                minid=task['id']
                mintask=task
        return mintask
    while tasks or run_queue:
        update_queue()
        if not run_queue:
            sleep_time = tasks[0]['arrival_time'] - time
            outputs.append(f"run_queue is empty, sleep for {sleep_time} ticks")
            time += sleep_time
            update_queue()
            continue
        miss=first_miss(run_queue)
        if miss!=None:
            outputs.append(f"thread#{miss['id']} misses a deadline at {miss['arrival_time'] + miss['period']}")
            return outputs
        
        task = run_queue.pop(0)
        start = time
        end = start+task['processing_time']
        end=min(end,task['arrival_time']+task['period'])
        
        for task2come in tasks:
            if priority(task2come) < priority(task):
                end=min(end,task2come['arrival_time'])
        
        exec_time=end-start
        outputs.append(f"dispatch thread#{task['id']} at {time}: allocated_time={exec_time}")
        task['processing_time']-=exec_time
        time+=exec_time
        update_queue()
        if task['processing_time']==0:
            outputs.append(f"thread#{task['id']} finish one cycle at {time}: {task['n']} cycles left")
        elif time==task['arrival_time']+task['period']:
            outputs.append(f"thread#{task['id']} misses a deadline at {task['arrival_time']+task['period']}")
            return outputs
        else:
            run_queue.append(task)
    return outputs

tasknum,rttasknum=4,6
def make_all():
    for i in range(1,tasknum+1):
        filename = f'input/task{i}.in'
        tasks = read_tasks(filename)
        result = weighted_round_robin(tasks)
        with open(f'WRR/task{i}.out', 'w') as f:
            for line in result:
                f.write(line + '\n')
    
    for i in range(1,tasknum+1):
        filename = f'input/task{i}.in'
        tasks = read_tasks(filename)
        result = shortest_job_first(tasks)
        with open(f'SJF/task{i}.out', 'w') as f:
            for line in result:
                f.write(line + '\n')

    for i in range(1,rttasknum+1):
        filename = f'input/rttask{i}.in'
        tasks = read_tasks(filename)
        result = least_slack_time(tasks)
        with open(f'LST/rttask{i}.out', 'w') as f:
            for line in result:
                f.write(line + '\n')

    for i in range(1,rttasknum+1):
        filename = f'input/rttask{i}.in'
        tasks = read_tasks(filename)
        result = rate_monotonic_scheduling(tasks)
        with open(f'DM/rttask{i}.out', 'w') as f:
            for line in result:
                f.write(line + '\n')

if __name__ == "__main__":
    tasks=read_tasks('input/rttask_random.in')
    outputs="\n".join(rate_monotonic_scheduling(tasks))+"\n"
    print(outputs)
    