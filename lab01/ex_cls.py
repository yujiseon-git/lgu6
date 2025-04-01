
class Person:
    def __init__(self, name, height, weight):
        self.name = name
        self.height = height
        self.weight = weight

    def speed(self):
        self.print()
        return (self.height / self.weight)* 5
    
    def print(self):
        print(f"나는 {self.name}이고 키{self.weight}이고 몸무게{self.height}이다.")

p1 = Person("Tom", 170, 100)
print(type(p1))
print(p1.name, p1.height, p1.weight)

p2 = Person("kim", 180, 85)
print(p2.name, p2.height, p2.weight)

print(p1.speed())
print(p2.speed())