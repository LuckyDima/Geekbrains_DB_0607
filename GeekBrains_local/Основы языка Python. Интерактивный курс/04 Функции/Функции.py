from random import randint as r


# 1: Создайте функцию, принимающую на вход имя, возраст и город проживания человека.
# Функция должна возвращать строку вида «Василий, 21 год(а), проживает в городе Москва»

def profile(name, age, city):
    print(f'{name}, {age} год(а), проживает в городе {city}')


profile('Василий', '21', 'Москва')


def profile2(*args):
    print(f'{args[0]}, {args[1]} год(а), проживает в городе {args[2]}')


profile2('Василий', '21', 'Москва')

print(f'_' * 50)


# 2: Создайте функцию, принимающую на вход 3 числа и возвращающую наибольшее из них.


def max_value():
    num = []
    for i in range(1, 4):
        el = input(f'Input {i} element:')
        num.append(el)
    print(f'Max element is:', max(num))


max_value()
print(f'_' * 50)

# 3: Давайте опишем пару сущностей player и enemy через словарь, который будет иметь ключи и значения:
# name - строка полученная от пользователя, health = 100, damage = 50.
# Поэкспериментируйте с значениями урона и жизней по желанию.
# Теперь надо создать функцию attack(person1, person2). Примечание: имена аргументов можете указать свои.
# Функция в качестве аргумента будет принимать атакующего и атакуемого.
# В теле функция должна получить параметр damage атакующего и отнять это количество от health атакуемого.
# Функция должна сама работать со словарями и изменять их значения.


quest = 'How is the player '
h = 'health'
d = 'damage'
g = ['attacker', 'defender']
d = dict([(g[0], {'name': input(f'{quest}1 name?'), h: r(1, 100), d: r(1, 50)}),
          (g[1], {'name': input(f'{quest}2 name?'), h: r(1, 100), d: r(1, 50)})])

print(f'-' * 30, '\n|Before attack|', '\nDefender life:  ', d['defender']['health'], '\r\nAttacker damage:',
      d['attacker']['damage'])


def attack(dic):
    dam = dic['defender']['health'] - dic['attacker']['damage']
    dic['defender'].update({'health': dam})
    print(f'-' * 30 + '\n|After attack|', '\nDefender life:  ', d['defender']['health'], '\r\nAttacker damage:',
          d['attacker']['damage'], '\n' + '-' * 30)


attack(d)
print(f'_' * 50)

# 4: Давайте усложним предыдущее задание.
# Измените сущности, добавив новый параметр - armor = 1.2 (величина брони персонажа)
# Теперь надо добавить новую функцию, которая будет вычислять и возвращать полученный урон по формуле damage / armor
# Следовательно, у вас должно быть 2 функции:
# Наносит урон. Это улучшенная версия функции из задачи 3.
# Вычисляет урон по отношению к броне.
# Примечание. Функция номер 2 используется внутри функции номер 1 для вычисления урона
# и вычитания его из здоровья персонажа.

d['defender'].update({'armor': 1.2})
d['defender'].update({'health': r(1, 100)})
d['attacker'].update({'damage': r(1, 50)})


def attack_with_armor(dic):
    def armor(a_dic):
        return a_dic['defender']['armor']
    print(f'-' * 30, '\n|Before attack|', '\nDefender life:  ', d['defender']['health'], '\r\nAttacker damage:',
          d['attacker']['damage'])
    dam = dic['defender']['health'] - int(dic['attacker']['damage']/armor(dic))
    dic['defender'].update({'health': dam})
    print(f'-' * 30 + '\n|After attack|', '\nDefender life:  ', d['defender']['health'], '\r\nAttacker damage:',
          d['attacker']['damage'], '\n' + '-' * 30)


attack_with_armor(d)
print(f'_' * 50)
