#ex_str.py

s = "hello python"
print(s) 

s = 'hello python'
print(s)

s = "hello \"EASY\" python"
print(s)

s = 'hello,\n "EASY" python'
print(s)

print(type(s))

s = """Hello,
"EASY" Python
"""
print(s)



###

a=10
b=20
c=a*b
print(f"c: {c} SUCCESS")
print(f"{a} X {b} = {c}")

d=5.2
e=21.234
f=d*e
print(f"{d:.2f} X {e:.2f} = {f:.3f}")

a = "hello"
print(f"{a:^11}")
print(f"{a:_^11}")


lang = "python"
ver ="3.10"
print(lang + ver)
print(lang * 3)
(lang+'')*3


s = 'pythonpython'

#count()
print(s.count('p'))

#find()
print(s.find('t'))

#replace() python을 PYTHON
print(s.replace('python','PYTHON'))

#split() 문자열로
print(s.split())

#join
L = ['python','java','c++']
print(','.join(L))

#strip() 벗기기
s= "<python@"
print(f"{s.strip('<@')}")

# isdigit(), isalpha(), isalnum()
s = "123"
print(s.isdigit()) # 숫자
print(s.isalpha()) # 알파벳
print(s.isalnum()) # 숫자 & 알파벳

