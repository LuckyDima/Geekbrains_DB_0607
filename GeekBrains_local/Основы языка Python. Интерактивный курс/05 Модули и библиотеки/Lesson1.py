# 1: Создайте модуль (модуль - программа на Python, т.е. файл с расширением .py).
# В нем создайте функцию создающую директории от dir_1 до dir_9 в папке из которой запущен данный код.
# Затем создайте вторую функцию удаляющую эти папки. Проверьте работу функций в этом же модуле.

import os


def mk_dirs():
    current_path = os.getcwd()
    try:
        for i in range(1, 10):
            path = f'{current_path}\dir_{i}'
            if os.path.exists(path):
                print(f'Directory {path} already exists.')
            else:
                os.mkdir(path)
                print(f'Directory {path} has been created.')
    except:
        print('Unknown error')


def del_dirs():
    current_path = os.getcwd()
    try:
        for i in range(1, 10):
            path = f'{current_path}\dir_{i}'
            if os.path.exists(path):
                os.rmdir(path)
                print(f'Directory {path} has been deleted.')
            else:
                print(f"Directory {path} doesn't exist.")
    except:
        print('Unknown error')


if __name__ == '__main__':
    mk_dirs()
    del_dirs()
    print('_' * 50)
