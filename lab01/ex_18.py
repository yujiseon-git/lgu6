# i =0

# while i < 10:
#     print(i)
#     # i = i + 1
#     i += 1
#     if i ==5:
#         break

# print("end while")

num = int(input("숫자를 입력하세요: "))

if num <= 0:
    print("양수를 입력하세요")

else:
    count = 0
    while num > 0:
        print(num)
        num -= 1
        count += 1
        
    print("반복 번수: ",count)
