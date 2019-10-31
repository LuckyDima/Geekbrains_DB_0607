# 1: Создать модуль music_serialize.py. В этом модуле определить словарь для вашей любимой музыкальной группы, например:
# С помощью модулей json и pickle сериализовать данный словарь в json и в байты, вывести результаты в терминал.
# Записать результаты в файлы group.json, group.pickle соответственно. В файле group.json указать кодировку utf-8.

from json import dump as jd, dumps as jds
from pickle import dump as pd, dumps as pds

my_favourite_group = {
    'name': 'Г.М.О.',
    'tracks': ['Последний месяц осени', 'Шапито'],
    'Albums': [{'name': 'Делать панк-рок', 'year': 2016},
               {'name': 'Шапито', 'year': 2014}]}


def js():
    with open('group.json', 'w', encoding='utf-8') as file:
        jd(my_favourite_group, file)


def pk():
    with open('group.pickle', 'wb') as file:
        pd(my_favourite_group, file)


if __name__ == '__main__':
    print(jds(my_favourite_group))
    print(pds(my_favourite_group))
    js()
    pk()
