#!/usr/bin/env python3

import re
from gradelib import *

import os

os.system("make -s --no-print-directory clean")
r = Runner(save("xv6.out"))

@test(1, f"custom_rttask1")
def test_uthread():
    r.run_qemu(shell_script([
        f'custom_rttask1'
    ]), make_args = ["SCHEDPOLICY=THREAD_SCHEDULER_LST"])
    expected = ""
    with open(f"custom/LST/rttask1.out","r") as f:
        expected=f.read()
    if not re.findall(expected, r.qemu.output, re.M):
        with open(f"custom_rttask1.out","w") as f:
            f.write(r.qemu.output)
            print(f"saved to custom_rttask1.out")
        raise AssertionError('Output does not match expected output')

@test(1, f"custom_rttask2")
def test_uthread():
    r.run_qemu(shell_script([
        f'custom_rttask2'
    ]), make_args = ["SCHEDPOLICY=THREAD_SCHEDULER_LST"])
    expected = ""
    with open(f"custom/LST/rttask2.out","r") as f:
        expected=f.read()
    if not re.findall(expected, r.qemu.output, re.M):
        with open(f"custom_rttask2.out","w") as f:
            f.write(r.qemu.output)
            print(f"saved to custom_rttask2.out")
        raise AssertionError('Output does not match expected output')

@test(1, f"custom_rttask3")
def test_uthread():
    r.run_qemu(shell_script([
        f'custom_rttask3'
    ]), make_args = ["SCHEDPOLICY=THREAD_SCHEDULER_LST"])
    expected = ""
    with open(f"custom/LST/rttask3.out","r") as f:
        expected=f.read()
    if not re.findall(expected, r.qemu.output, re.M):
        with open(f"custom_rttask3.out","w") as f:
            f.write(r.qemu.output)
            print(f"saved to custom_rttask3.out")
        raise AssertionError('Output does not match expected output')

@test(1, f"custom_rttask4")
def test_uthread():
    r.run_qemu(shell_script([
        f'custom_rttask4'
    ]), make_args = ["SCHEDPOLICY=THREAD_SCHEDULER_LST"])
    expected = ""
    with open(f"custom/LST/rttask4.out","r") as f:
        expected=f.read()
    if not re.findall(expected, r.qemu.output, re.M):
        with open(f"custom_rttask4.out","w") as f:
            f.write(r.qemu.output)
            print(f"saved to custom_rttask4.out")
        raise AssertionError('Output does not match expected output')

@test(1, f"custom_rttask5")
def test_uthread():
    r.run_qemu(shell_script([
        f'custom_rttask5'
    ]), make_args = ["SCHEDPOLICY=THREAD_SCHEDULER_LST"])
    expected = ""
    with open(f"custom/LST/rttask5.out","r") as f:
        expected=f.read()
    if not re.findall(expected, r.qemu.output, re.M):
        with open(f"custom_rttask5.out","w") as f:
            f.write(r.qemu.output)
            print(f"saved to custom_rttask5.out")
        raise AssertionError('Output does not match expected output')


@test(1, f"custom_rttask6")
def test_uthread():
    r.run_qemu(shell_script([
        f'custom_rttask6'
    ]), make_args = ["SCHEDPOLICY=THREAD_SCHEDULER_LST"])
    expected = ""
    with open(f"custom/LST/rttask6.out","r") as f:
        expected=f.read()
    if not re.findall(expected, r.qemu.output, re.M):
        with open(f"custom_rttask6.out","w") as f:
            f.write(r.qemu.output)
            print(f"saved to custom_rttask6.out")
        raise AssertionError('Output does not match expected output')

run_tests()
os.system("make -s --no-print-directory clean")
