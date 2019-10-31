def per(**kwargs):
    for a,b in kwargs.items():
        print(f'Param1: {a}, Param2: {b}')

per(name = 'Dima', age = 34, has_car = True)

def per2(*args):
    print(f'Params: {args}')

per2('One','Two','Three')