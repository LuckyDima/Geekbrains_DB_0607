'''
def switch_case(case):
    return "You entered " + {
    '1' : "one",
    '2' : "two",
    '3' : "three"
    }.get(case, "an out of range number")

num = input("Input a number between 1 and 3: ")
print (switch_case(num))


from random import randint as r
quest = 'How is the fist player name?'
h = 'health'
d = 'damage'#
g = ['attacker','defender']
d = dict([(g[0], {'name': input(f'{quest}'), h: 100, d: 50}), \
          (g[1], {'name': input(f'{quest}'), h: r(1,100), d: r(1,50)})])
print(d)'''

# def createGenerator():
#     for i in range(5):
#         yield i * i
#
#
# for i in createGenerator():
#     print(i)


num = [5, 4, 3, 2, 1, 0, -1, -2, -3]
print([num for num in num if num > 0])

print([x**2 for x in range(101)])


import random
group_of_items = {1, 2, 3, 4}               # a sequence or set will work here.
num_to_select = 2                           # set the number to select here.
list_of_random_items = random.sample(group_of_items, num_to_select)
first_random_item = list_of_random_items[0]
second_random_item = list_of_random_items[1]
print(list_of_random_items)
