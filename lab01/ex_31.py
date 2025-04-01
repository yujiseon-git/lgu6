teams = ['타이거즈', '라이온즈', '트윈스', '베어스', '위즈',
         '랜더스', '자이언츠', '이글스', '다이노스즈', '히어로즈']

# teams.index(i)뒤 +1
for i in teams:
    print(teams.index(i),i)

for i in range(10):
    print(f"{i+1}위 {teams[i]}")

for i in range(len(teams)):
    print(f"{i+1}위 {teams[i]}")
   