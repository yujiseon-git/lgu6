
# with open("file-w.txt", "w", encoding="utf-8") as f:
#     f.write("Hello python\n")
#     f.write("안녕 파이썬")

# with open("file-w.txt", "r", encoding="utf-8") as f:
#     lines = f.readlines()
#     # print(lines, type(lines))
#     for line in lines:
#         print(line, end='')

import ex_45
import os
# ex_45.mean(), ex_45.std()

input_files = os.listdir('./data')

with open('ex_45.txt', 'w') as fw:
    for file in input_files:
            if file[-3:] == 'txt':
                name = file[:-4]
                scores = []

                with open(f"./data/{file}", "r", encoding="utf-8") as f:
                    lines = f.readlines()
                    for line in lines:
                        int(line)
                        scores.append(int(line))

                m = ex_45.mean(scores)
                sigma = ex_45.std(scores)
                fw.write(f"{name} : {m}, {sigma}\n")