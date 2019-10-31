x = 2
result = x * 10 if x < 10 else x / 10
print (result)


from pynput import keyboard as k
import random as r

number = r.randint(1, 100)
finish = 0

print(f'Моё число {number}')


def on_release(key,finish=finish):
    if key == k.Key.esc:
        print('Вы закончили игру.')
        return False
    elif key == k.Key.left:
        print(f'Загаданное число меньше моего.')
    elif key == k.Key.right:
        print(f'Загаданное число больше моего.')
    elif key in (k.Key.up, k.Key.down):
        print('~~~~~~~ Я угадал! ~~~~~~~')
        return False
    else:
        print('Пожалуйста используйте кнопки со стрелками или Esc для выхода из программы.')

    return finish


def on_press(key):
    print(key, finish)


with k.Listener(on_release=on_release
        , on_press=on_press
                ) as listener:
    listener.join()
print(finish)
