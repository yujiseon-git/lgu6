shoplist = ['apple', 'mango', 'carrot', 'banana']
print(shoplist)
print(type(shoplist))

#자주 쓰는 기능
###################################

# 특정 위치값 변경
shoplist[0] = 'melon'
print(shoplist)

#마지막에 요소 추가
shoplist.append('lego')
print(shoplist)

#리스트 나 시퀀스 추가
shoplist.extend(['소고기', '닭고기'])
print(shoplist)

print(shoplist + ['소고기', '닭고기'])
print(shoplist)

#제거 remove
shoplist.remove('소고기')
print(shoplist)

#제거 del index
del shoplist[0]
print(shoplist)

# index 어떤 특정값이 몇번째 위치해 있는지
i = shoplist.index('banana')
print(i)

# 리스트의 길이
print(len(shoplist))

# 빈 리스트
L = []

# 정렬
L = [3,5,1,2,3,4]
L.sort() #오름차순(기존 'L'리스트를 변경)
L.sort(reverse=True) #역순 정렬
print(L)

L = [3,5,1,2,3,4]
L_sorted = sorted(L)  
#오름차순(기존 'L'리스트는 유지/L_sorted는 오름차순으로 변경)
print(L) 
print(L_sorted)

#    0, 1, 2, 3, 4, 5, 6, 7
L = [1, 2, 3, 4, 5, 6, 7, 8]
#   -8,-7,-6,-5,-4,-3,-2,-1
print(L[3])

# 슬라이싱
# L[start:end:stride]
print(L[1:3:1])

# 셋다 생략
print(L[::])

# start,stride 생략
print(L[:3])

# end, stride 생략
print(L[3:])

# start,end 생략
print(L[::2])

# 음수인덱스를 사용한 슬라이싱
print(L[-3:])
print(L[-7:-4])

# 음수인덱스를 이용해서 역순으로 슬라이싱
print(L[-2:-6:-1])



L = [[1,2,3],
     [4,5,6]]

print(L[0][2])
print(L[1][0])


