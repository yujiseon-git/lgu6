# 100보다 작은 3의 배수를 출력하세요.

for i in range(3,100,3):
    print(i)

j = 0
for j in range(1,100):
    if j % 3 == 0:
        print(j)