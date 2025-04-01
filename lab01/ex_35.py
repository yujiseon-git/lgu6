
A = [[1,0,1],[0,2,0],[1,2,1]]
B = [[2,3,1],[0,1,1],[1,1,1]]
C = [[0,0,0],[0,0,0],[0,0,0]]

# 행 i 열 j

for i in range(len(A)):
    for j in range(len(A[0])):
        # print(i,j)
        C[i][j] = A[i][j] + B[i][j]

print(C)