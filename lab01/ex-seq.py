
S = "python"
print(S[0])
for s in S:
    print(s)

#나열되어있는것

# i = "123"
# print(s[0])

zoo = ('python', 'elephant', 'penguin')
print(zoo)
print(zoo[2])

#IndexError
print(zoo(3))
#TypeError
print(zoo['c'])

#패킹
numbers = 1, 2, 3
#언패킹
i1 = numbers[0]
i2 = numbers[1]
i3 = numbers[2]
i1, i2, i3 = numbers