
import random

class Linear:
    def __init__(self, in_feauter, out_feauter):
        self.weight = [] #in_feauter행, out_feauter열
        self.bias = [random.random(),random.random()]
        for i in range(out_feauter):
            temp = []
            for j in range(in_feauter):
                temp.append(random.random)
            self.weight.append(temp)

        def matmul(self, A, B):
            row = len(A) 
            col = len(B[0])
            C = []

            for i in range(row):
                temp = []
                for j in range(col):
                    temp.append(0)
                C.append(temp)

            for i in range(len(A)):
                for j in range(len(B[0])):
                    # A의 i행과 B의 j행을 내적
                    for k in range(len(A[0])):
                        C[i][j] += A[i][k]*B[k][j]
            return C
        
        def forward(self, x):
            Z = self.matmul(x,self.weight)
            # x * self.weight + self.bias
            for i in range(len(Z)):
                for j in range(len(self.bias)):
                    Z[i][j] = Z[i][j] + self.bias[j]

            return Z
        
linear = Linear(3, 2)
x = [[1,2,3],
     [4,5,6]]

print(linear.forward(x))



