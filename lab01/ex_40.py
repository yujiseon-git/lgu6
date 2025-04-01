#//몫
#%나머지

# def Qr(x,y):
#     while x > 1:
#         x -= y 
#         count = 0
#         count += 1
#     return(x, count)   


def Qr(x,y):
    q=0
    r=0
    while True:
        x -= y
        if x > 0:
            q += 1
        elif x < 0:
            r = x+y
            break
        else:
            q += 1
            break

    return(q,r)

x=10
y=3 
ret = Qr(x,y)
print(ret[0],ret[1])