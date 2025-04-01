import math

def mean(l):
    S = 0
    for k in range(len(l)):
        x_k = l[k]
        S += x_k

    N = len(l)
    m = S/N
    return m

def std(l):
    m = mean(l)
    # for x_k in l:
    #     S += (x_k - m)**2
    # var = S / len(l)
    var = mean([(x_k - m)**2 for x_k in l])
    sigma = math.sqrt(var)
    return sigma


if __name__ == '__main__':
    L = [1,2,3,4,5,6,7,8,9,10]
    print(std(L))