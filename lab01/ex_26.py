#무한 루프 메뉴 구성

while True:
    print("[메뉴를 입력하세요]")
    n = input("1. 게임시작 2. 랭킹보기 3. 게임종료 : ")
    
    if n == '3':
        print("게임을 종료합니다.")
        break
    elif n == '1':
        print("게임을 시작합니다.")
    elif n == '2':
        print("실시간 랭킹")
    else:
        print("다시 입력해주세요.")