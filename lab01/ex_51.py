import ex_45

s = input("평균울 구할 숫자를 입력하세요(콤마 또는 공백으로 구분): ")

L = [int(i) for i in s.replace(',','').split()]
print(L)

ex_45.mean(L)