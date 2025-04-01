# 사용자에게 5번의 기회를 주고 패스워드를 입력받는 로그인 로직
# case 1
pw = "1234"
success = False
for i in range(5):
    user_pw = input("패스워드를 입력하세요: ")

    if pw == user_pw:
        print("로그인 성공")
        success = True
        break
    else:
        print("다시 입력하세요.")

if success == False:
    print("잠금")

# case 2 <권장하지 않음>
for i in range(5):
    user_pw = input("패스워드를 입력하세요: ")

    if pw == user_pw:
        print("로그인 성공")
        success = True
        break
else:
    print("5번 잘못입력하였습니다.")