data = [
    {'name' : '철수',  'math' : 85, 'eng' : 90, 'sic':75},
    {'name' : '준호',  'math' : 73, 'eng' : 85, 'sic':93},
    {'name' : '영희',  'math' : 92, 'eng' : 88, 'sic':90} 
]

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