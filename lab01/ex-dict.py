

d = {
    'foo' : 'foo@naver.com',
    'bar' :'bar@naver.com',
    'egg' : 'egg@naver.com'
}

print(d)

print(d['foo'])

# 값 삭제
del d['foo']
print(d)

# 새로운 값 추가
d['foo'] = 'foo@naver.com'
print(d)

# 기존값 업데이트
d['foo'] = 'foo@kdt.co.kr'
print(d)

# 
d['list'] =[1,2,3,4,5]
print(d)

print(d.keys())

# 아래 3개는 같은 값을 출력
for key in d.keys():
    print(key)

for key in d:
    print(key)

for value in d.values():
    print(value)

for key,value in d.items():
    print(key, value)

