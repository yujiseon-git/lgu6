
class BankAccount:
    def __init__(self, owner, password, balance=0):
        self.owner = owner
        self.balance = balance
        self.password = password
        print(f"{owner}님의 비밀번호가{password}인 계좌가 잔액{balance}원으로 개설되었습니다.")

    def deposit(self, amount):
        if amount > 0:
            self.balance += amount
            print(f"{amount}원이 입금되었습니다.")
        else:
            print("0원 보다 큰 금액을 입금해주세요.")

    def get_balance(self):
        pw = input("비밀번호를 입력하세요: ")
        if self.password == pw:
            print(f"게좌의 현재 잔액은 {self.balance}원 입니다.")
        else:
            print("비밀번호가 다릅니다.")

    def withdraw(self,amount):
        if 0 < amount < self.balance:
            self.balance -= amount
            print(f"{amount}원이 출금되었습니다.")
        else:
            print("출금잔액이 부족합니다.")

    def remittance(self, amount, account):
        self.withdraw(amount)

        account.deposit(amount)
        
#계좌 생성

account1 = BankAccount("홍길동", '1234',10000)
account1.deposit(5000)
account1.get_balance()
account1.withdraw(3000)
account2 = BankAccount("김길동", '1234',10000)
account2.remittance(5000,account1)



