#!/usr/bin/env python3

import re
from gradelib import *

import os
from custom.make_random_task import make_task,make_rttask
from custom.make_out import *


def make_code(tasks):
    code="""#include "kernel/types.h"
          #include "user/user.h"
          #include "user/threads.h"
          #define NULL 0
          int k = 0;
          void f(void *arg){
              while (1) k++;
          }
          int main(int argc, char **argv){
          """
    i=1
    for task in tasks:
        varname=f"t{i}"
        i+=1
        code+=f"struct thread *{varname} = thread_create(f, NULL, {task['is_real_time']}, {task['processing_time']}, {task['period']}, {task['n']});\n"
        code+=f"thread_set_weight({varname}, {task['weight']});\n"
        code+=f"thread_add_at({varname}, {task['arrival_time']});\n"
    code+="""thread_start_threading();
          printf("\\nexited\\n");
          exit(0);
          }"""
    return code

# ===================================================================

input_task=make_task()
with open("custom/input/task_random.in","w") as f:
    f.write(input_task)
tasks=read_tasks("custom/input/task_random.in")
with open("user/custom_task.c","w") as f:
    f.write(make_code(tasks))

WRR_output="\n".join(weighted_round_robin(tasks))+"\n"
with open("custom/WRR/custom_task.out","w") as f:
    f.write(WRR_output)
SJF_output="\n".join(shortest_job_first(tasks))+"\n"
with open("custom/SJF/custom_task.out","w") as f:
    f.write(SJF_output)

# ===================================================================

input_rttask=make_rttask()
with open("custom/input/rttask_random.in","w") as f:
    f.write(input_rttask)
rttasks=read_tasks("custom/input/rttask_random.in")
with open("user/custom_rttask.c","w") as f:
    f.write(make_code(rttasks))

LST_output="\n".join(least_slack_time(rttasks))+"\n"
with open("custom/LST/custom_rttask.out","w") as f:
    f.write(LST_output)
DM_output="\n".join(rate_monotonic_scheduling(rttasks))+"\n"
with open("custom/DM/custom_rttask.out","w") as f:
    f.write(DM_output)

# ===================================================================

r = Runner(save("xv6.out"))

# #WRR
# @test(1, f"custom_task for WRR")
# def test_uthread():
#     os.system("make -s --no-print-directory clean")
#     r.run_qemu(shell_script([
#         f'custom_task'
#     ]), make_args = ["SCHEDPOLICY=THREAD_SCHEDULER_WRR"])
#     expected = WRR_output
#     if not re.findall(expected, r.qemu.output, re.M):
#         with open(f"custom_task_wrr.out","w") as f:
#             f.write(r.qemu.output)
#             print(f"saved to custom_task_wrr.out")
#         raise AssertionError('Output does not match expected output')
    
#SJF
@test(1, f"custom_task for SJF")
def test_uthread():
    # os.system("make -s --no-print-directory clean")
    r.run_qemu(shell_script([
        f'custom_task'
    ]), make_args = ["SCHEDPOLICY=THREAD_SCHEDULER_SJF"])
    expected = SJF_output
    if not re.findall(expected, r.qemu.output, re.M):
        with open(f"custom_task_sjf.out","w") as f:
            f.write(r.qemu.output)
            print(f"saved to custom_task_sjf.out")
        raise AssertionError('Output does not match expected output')

# #LST
# @test(1, f"custom_rttask for LST")
# def test_uthread():
#     os.system("make -s --no-print-directory clean")
#     r.run_qemu(shell_script([
#         f'custom_rttask'
#     ]), make_args = ["SCHEDPOLICY=THREAD_SCHEDULER_LST"])
#     expected = LST_output
#     if not re.findall(expected, r.qemu.output, re.M):
#         with open(f"custom_rttask_lst.out","w") as f:
#             f.write(r.qemu.output)
#             print(f"saved to custom_rttask_lst.out")
#         raise AssertionError('Output does not match expected output')

# #DM
# @test(1, f"custom_rttask for DM")
# def test_uthread():
#     os.system("make -s --no-print-directory clean")
#     r.run_qemu(shell_script([
#         f'custom_rttask'
#     ]), make_args = ["SCHEDPOLICY=THREAD_SCHEDULER_DM"])
#     expected = DM_output
#     if not re.findall(expected, r.qemu.output, re.M):
#         with open(f"custom_rttask_dm.out","w") as f:
#             f.write(r.qemu.output)
#             print(f"saved to custom_rttask_dm.out")
#         raise AssertionError('Output does not match expected output')

run_tests()
# os.system("make -s --no-print-directory clean")
