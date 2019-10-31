# 2: Создайте модуль. В нем создайте функцию, которая принимает список и возвращает из него случайный элемент.
# Если список пустой функция должна вернуть None. Проверьте работу функций в этом же модуле.
# Примечание: Список для проверки введите вручную. Или возьмите этот: [1, 2, 3, 4]

from random import choice, randint


def rand_request(user_list=[i * randint(1, 100) for i in (range(randint(0, 5))) if i > 0]):
    if user_list:
        print(f'Random element is:', choice(user_list), '\nFull list:', user_list)
    else:
        print('None')


if __name__ == '__main__':
    rand_request()
    rand_request([1, 2, 3, 4])
