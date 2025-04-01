# 사용자에게 패스워드를 성공할때까지 입력받는 로직

# case 1

PW = "1234"
while True:
    user_pw = input("pw: ")

    if PW == user_pw:
        print('로그인 성공')
        break
    else:
        print("패스워드가 틀립니다.")

# case 2

PW = "1234"
user_pw = ""
while PW != user_pw:
    user_pw = input("pw: ")

    if PW == user_pw:
        print("로그인 성공")
    else:
        print("다시 입력")

# case 3

while PW != input("PW: "):
    print("다시 입력하세요")
else:
    print("로그인 성공")