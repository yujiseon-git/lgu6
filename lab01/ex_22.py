# 사용자에게 임의의 자연수 n을 입력받고 1에서 n까지의 모두 합산하는 프로그램

n = int(input("자연수를 입력하세요: "))
i = 1
totle = 0
for n in range(i,(n+1)):
    totle += i 
    i += 1

    if i == n :
        break

print(totle)

#강사쌤 풀이

n = int(input("자연수를 입력하세요: "))
s = 0
for i in range(1,(n+1)):
    s += i

print(s)