number = [0,100]

while True:
    my_num = int(sum(number)/len(number)) #Получаем среднее значение
    print(f'Моё число: {my_num}')
    sing = input(f'Введите ">" если ваше число больше моего\n "<" если меньше или "=" если угадал\n')
    if sing == '>':
        number.remove(min(number))
        number.append(my_num)
    elif sing == '<':
        number.remove(max(number))
        number.append(my_num)
    else:
        print(f'Я угадал! Ваше число: {my_num}')
        break


