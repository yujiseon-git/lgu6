# 모든 구구단 출력 프로그램

for i in range(2,10):
    if i > 2:
        print('-'*20)

    for j in range(1,10):
        print(f"{i} X {j} = {i*j}")