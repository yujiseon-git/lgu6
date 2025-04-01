# 다음 모양의 별을 출력해보기

# for i in range(5,0,-1):
#     print('*'*i, end='')
#     for j in range(1):
#         print()


n=5
for i in range(n):
    for j in range(n-i):
        print('*', end='')
    print()