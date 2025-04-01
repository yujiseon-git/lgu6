n = int(input("n: "))

# L=[]
# for i in range(1,n+1):
#     L.append(i)

L = [i for i in range(1,n+1) if i % 2 == 0]

print(L)