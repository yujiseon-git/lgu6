

# def gat_number_generator(n):
#     for i in range(n):
#         print("before yieid")
#         yield i
#         print("after yield")

# number = gat_number_generator(3)
# print(next(number, 'end'))
# print()

# print(next(number, 'end'))
# print()

# print(next(number, 'end'))
# print()

def int_number_gen():
    i = 1

    while True:
        yield i
        i += 1

num = int_number_gen()
print(next(num))
print(next(num))
print(next(num))
print(next(num))
print(next(num))


