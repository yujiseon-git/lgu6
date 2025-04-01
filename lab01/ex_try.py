operations = {
    '+': lambda x, y: x + y,
    '-': lambda x, y: x - y,
    '*': lambda x, y: x * y,
    '/': lambda x, y: x / y if y != 0 else "오류: 0으로 나눌 수 없습니다"
}

# a = int(input('첫 번째 숫자를 입력하세요: '))
# b = int(input('두 번째 숫자를 입력하세요: '))
# c = input('연산자를 입력하세요(+,-,*,/): ')

try:
    a = float(input('첫 번째 숫자를 입력하세요: '))
    b = float(input('두 번째 숫자를 입력하세요: '))
    c = input('연산자를 입력하세요(+,-,*,/): ')
    result = operations[c](a,b)
    print(result)
except ZeroDivisionError as e:
    print("0으로 나눌 수 없습니다.")
except ValueError as e:
    print("입력 값을 확인하세요.")
except KeyError as e:
    print("연산자를 확인하세요.")

