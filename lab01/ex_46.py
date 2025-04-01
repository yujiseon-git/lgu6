
import random

def game():
    lottery = []
    while len(lottery) < 6:
        n = random.randrange(1,10)

        dup = False
        for j in lottery:
            if n == j:
                dup = True

        if dup == False:
            lottery.append(n)
    return lottery

N =int(input("몇 게임? : "))
print([game() for n in range(N)])



# import random

# lottery = []
# while len(lottery) < 6:
#     n = random.randrange(1, 46)
#     if n not in lottery:
#         lottery.append(n)


