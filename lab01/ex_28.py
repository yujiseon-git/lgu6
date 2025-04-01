# 다음 모양의 별을 출력해보기

for i in range(1,6):
    print('*'*i, end='')
    for j in range(1):
        print()

# 강사님 코드
n=5
for i in range(n):
    for j in range(i+1):
        print('*', end='')
    print()


n=5
for i in range(n):
    row = ''
    for j in range(i+1):
        row += '*'
    print(row)