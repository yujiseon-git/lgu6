x = float(input("x: "))
mu = float(input("mu: "))
sigma = float(input("sigma: "))

f = (1/(sigma * 2.506)) * 2.718**(-(((x - mu)**2) / (2 * sigma**2)))

print("f(x) :", f)