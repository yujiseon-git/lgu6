operations = {
    '+': lambda x, y: x + y,
    '-': lambda x, y: x - y,
    '*': lambda x, y: x * y,
    '/': lambda x, y: x / y if y != 0 else "오류: 0으로 나눌 수 없습니다"
}

a = int(input('첫 번째 숫자를 입력하세요: '))
b = int(input('두 번째 숫자를 입력하세요: '))
c = input('연산자를 입력하세요(+,-,*,/): ')
if c in operations: #['+', '-', '*','/']:
    # add = operations[c]
    # print(add(a,b))

    print(operations[c](a,b))
else:
    print('올바른 연산이 아닙니다.')
