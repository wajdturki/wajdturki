class student:
    
    def __init__(self, name, age):
        self.name = name
        self.age = age
o1 = student()
o1 = ("wajd", 23)

print(o1.name)
print(o1.age)

#------------------------

class student:
    def print_max(self, x, y):
        if x > y:
            print(x, 'is bigger')
        elif x < y:
            print(y, 'is bigger')
        else:
            print('They are equal')
o2 = student()
o2.print_max(20, 30)
#o2.print_max(29, 22)
#o2.print_max(55, 60)

#------------------------

class student:
    def print_min(self, x, y):
        if x < y:
            print(x, 'is smaller')
        elif x > y:
            print(y, 'is smaller')
        else:
            print('They are equal')
o3 = student()
o3.print_min(20, 30)


