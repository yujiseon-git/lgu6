numbers = [10, 4, 5, -1, 6, 12, 40]

# total = 0
# for i in numbers[1::2]:
#     total += i
# print(total)


# case 2
# p = numbers[1::2]
# S = 0
# for i in range(len(p)):
#     S += p[i]
# print(S)


# 최대값 찾기
m = numbers[0]
for i in numbers[1:]:
    if i > m:
        m = i
print(m)


    

