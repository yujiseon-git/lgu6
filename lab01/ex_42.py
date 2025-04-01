
X = [[78, 80, 95, 55, 67, 43], [45, 67, 90, 87, 88, 93]]

def mean(l):
    S = 0
    for k in range(len(l)):
        x_k = l[k]
        S += x_k

    N = len(l)
    m=S/N
    return m

avg = []
for i in X:
    m = mean(i)
    avg.append(round(m,2))

print(avg)


avg = [round(mean(x),3) for x in X]
print(avg)

