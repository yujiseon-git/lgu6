# a = -3

# if a > 0:
#     print("positive")
# elif a < 0:
#     print("negative")
# else:
#     print("zero")

height = float(input("키(m)를 입력하세요: "))
weight = float(input("몸무게(kg)를 입력하세요: "))
bmi = round(weight/height**2,3)

# if bmi < 18.5:
#     print("저체중", "BMI: ", bmi)
# elif 18.5 <= bmi < 23:
#     print("정상", "BMI: ", bmi)
# elif 23<= bmi < 25:
#     print("과체중", "BMI: ", bmi)
# else:
#     print("비만", "BMI: ", bmi) 

if bmi >= 25:
    print("비만", "BMI: ", bmi)
elif bmi >= 23:
    print("과체중", "BMI: ", bmi)
elif bmi >= 18.5:
    print("정상", "BMI: ", bmi)
else:
    print("저체중", "BMI: ", bmi) 