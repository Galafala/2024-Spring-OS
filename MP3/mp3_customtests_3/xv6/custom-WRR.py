#!/usr/bin/env python3

import re
from gradelib import *

import os

os.system("make -s --no-print-directory clean")
r = Runner(save("xv6.out"))

@test(1, f"custom_task1")
def test_uthread():
    r.run_qemu(shell_script([
        f'custom_task1'
    ]), make_args = ["SCHEDPOLICY=THREAD_SCHEDULER_WRR"])
    expected = ""
    with open(f"custom/WRR/task1.out","r") as f:
        expected=f.read()
    if not re.findall(expected, r.qemu.output, re.M):
        with open(f"custom_task1.out","w") as f:
            f.write(r.qemu.output)
            print(f"saved to custom_task1.out")
        raise AssertionError('Output does not match expected output')

@test(1, f"custom_task2")
def test_uthread():
    r.run_qemu(shell_script([
        f'custom_task2'
    ]), make_args = ["SCHEDPOLICY=THREAD_SCHEDULER_WRR"])
    expected = ""
    with open(f"custom/WRR/task2.out","r") as f:
        expected=f.read()
    if not re.findall(expected, r.qemu.output, re.M):
        with open(f"custom_task2.out","w") as f:
            f.write(r.qemu.output)
            print(f"saved to custom_task2.out")
        raise AssertionError('Output does not match expected output')

@test(1, f"custom_task3")
def test_uthread():
    r.run_qemu(shell_script([
        f'custom_task3'
    ]), make_args = ["SCHEDPOLICY=THREAD_SCHEDULER_WRR"])
    expected = ""
    with open(f"custom/WRR/task3.out","r") as f:
        expected=f.read()
    if not re.findall(expected, r.qemu.output, re.M):
        with open(f"custom_task3.out","w") as f:
            f.write(r.qemu.output)
            print(f"saved to custom_task3.out")
        raise AssertionError('Output does not match expected output')

@test(1, f"custom_task4")
def test_uthread():
    r.run_qemu(shell_script([
        f'custom_task4'
    ]), make_args = ["SCHEDPOLICY=THREAD_SCHEDULER_WRR"])
    expected = ""
    with open(f"custom/WRR/task4.out","r") as f:
        expected=f.read()
    if not re.findall(expected, r.qemu.output, re.M):
        with open(f"custom_task4.out","w") as f:
            f.write(r.qemu.output)
            print(f"saved to custom_task4.out")
        raise AssertionError('Output does not match expected output')

run_tests()
os.system("make -s --no-print-directory clean")
