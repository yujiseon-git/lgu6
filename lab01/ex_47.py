import pandas as pd


df = pd.read_excel("./data/scores.xlsx")

df = df.T.to_dict()
data = [v for k,v in df.items()]
print(data)


result = {}

for d in data:
    total = 0
    count = 0
    for k,v in d.items():
        if k != 'name':
            total += v
            count += 1
    avg = total / count

    result[d['name']] = [total,round(avg,4)]

print(result)