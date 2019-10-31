# 2: Создать модуль music_deserialize.py. В этом модуле открыть файлы group.json и group.pickle,
# прочитать из них информацию. И получить объект: словарь из предыдущего задания.

import music_serialize as ms
from json import load as jl
from pickle import load as pl

ms.js()
ms.pk()

with open('group.json', 'r', encoding='utf-8') as file:
    print(jl(file))


with open('group.pickle', 'rb') as file:
    print(pl(file))
