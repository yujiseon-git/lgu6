

en2ko = {
    'book' : '사전',
    'snake' : '뱀',
    'language' : '언어'
}

ko2en = {}

for key,value in en2ko.items():
    ko2en[value] = key

print(ko2en)