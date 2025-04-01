# 사용자로 부터 단수를 입력받고 해당하는 단의 구구단 테이블을 출력하세요.

n = int(input("단수를 입력하세요: "))

for i in range(1,10):
    j=i*n
    print(f"{n} X {i} = {j}")