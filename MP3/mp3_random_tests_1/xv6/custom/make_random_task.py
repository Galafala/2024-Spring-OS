import random
# is real time, processing time, period, n, weight, arrival time

def make_task():
    ret=""
    ret+="15\n"
    for i in range(1,16):
        ret+=f"0 {random.randrange(1,65)} -1 1 {random.randrange(1,5)} {random.randrange(101)}\n"
    return ret

def make_rttask():
    ret=""
    cpu_usage=0
    r=random.random()
    r=max(r,0.2)
    num=0
    while num<15:
        per=random.randrange(1,101)
        pt=random.triangular(1,per,per//5)
        n=random.randrange(1,11)
        at=random.randrange(101)
        usage=pt/per
        if cpu_usage+usage>1:
            break
        num+=1
        ret+=f"1 {int(pt*r)+1} {per} {n} 1 {at}\n"
        cpu_usage+=usage
    ret=f"{num}\n"+ret
    return ret
