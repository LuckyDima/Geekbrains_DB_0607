# a = 'hello'
# print(type(a))
# print(dir(a))


a = 15,846.5,'hello',True
# print(type(a[1]))
# print (dir(a))
# a.append('end')
# print(a)

a = list(a)
a[0] = False

# print(a)
# print(type(a[1]))
# print(dir(a))

b = 45
c = 'hello'

print(b,c)

b, c = c, b

print(b,c)
