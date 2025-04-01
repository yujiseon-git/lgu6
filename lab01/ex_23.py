# 아이디와 비번을 모두 검사하는 로그인 로직

ID = "python"
passwd = "abcd"

user_id = input("아이디를 입력하세요: ")

if ID == user_id:
    pw = input("비번을 입력하세요: ")
    if passwd == pw:
        print("로그인 성공")
    else:
        print("로그인 실패")
else:
    print("그런 아이디는 존재하지 않습니다.")

        
