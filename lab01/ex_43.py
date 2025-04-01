

def print_all(*args, **kwargs):
    print(args)
    print(kwargs)

print_all(1, 2, 3, 4, 5, 6, 
          x=100,y=300,z=400)