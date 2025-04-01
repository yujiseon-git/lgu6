# scores = [[90, 85, 93], 
#           [78, 92, 89]]

# # print(len(scores[0]))

# name = 0
# total = 0
# #과목별
# for i in range(len(scores[0])):
#     for j in range(len(scores)):
#         name += scores[j][i]
#     print(name)

# #학생별
# for i in range(len(scores)):
#     for j in range(len(scores[0])):
#         total += scores[i][j]
#     print(total)

##########################################

# total_by_students = [0,0]
# total_by_subjects = [0,0]
# for st in range(len(scores)):
#     for sb in range(len(scores[0])):
#         total_by_students[st] += scores[st][sb]
#         total_by_subjects[sb] += scores[st][sb]

# print(total_by_students)
# print(total_by_subjects)


A = [[1,2,3],[4,5,6],[7,8,9]]
B = []

for row in A:
    temp = []
    for a in row:
        temp.append(a*2)
    print(temp)
    B.append(temp)
    
print(B)