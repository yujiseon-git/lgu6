
def mean(l):
    return sum(l) / len(l) 
 
avg = mean([1,2,3])
print(avg)


def mean(l):
    S = 0
    for k in range(len(l)):
        x_k = l[k]
        S += x_k

    N = len(l)
    m=S/N
    return m

avg = mean([1,2,3])
print(avg)

