import random


def new_game(new=0):
    words_list = ('автострада', 'бензин', 'инопланетянин',
                  'самолёт', 'библиотека', 'чемпионат', 'олимпиада',
                  'шайба', 'клён'
                  )
    secret_word = random.choice(words_list)
    original_secret_world = secret_word
    secret_word = secret_word.replace('ё', 'е').replace('й', 'и')
    if new == 0:
        user_word = ['*'] * len(secret_word)
    elif new == 1:
        print("Хотите сыграть снова? (Д(да)\Любая буква(нет))")
        answer = input()
        if answer.lower() != 'д':
            print("До свидания.")
            exit()
        else:
            user_word = ['*'] * len(secret_word)
    return list(secret_word), list(user_word), int(0), list(original_secret_world)


secret_word, user_word, errors_counter, original_secret_world = new_game()
print("Для выхода вместо слова неберите exit.")

while True:
    print(''.join(user_word))
    letter = input('Ваша буква: \n').lower()
    if letter == 'exit':
        break
    if 'ё' or 'й' in letter:
        letter = letter.replace('ё', 'е').replace('й', 'и')
    if len(letter) != 1 or not letter.isalpha() or ord(letter) not in range(1072, 1103):
        continue
    if letter in secret_word:
        for position, symbol in enumerate(secret_word):
            if letter == symbol:
                user_word[position] = letter
                if '*' not in user_word:
                    print("Вы выйграли!")
                    secret_word, user_word, errors_counter, original_secret_world = new_game(1)
            continue
    else:
        errors_counter += 1
        print('\tВсего ошибок:', errors_counter)
        if errors_counter == 8:
            print("-------------------------------\nВы проиграли!\nБыло загадано слово:",
                  ''.join(original_secret_world),
                  "\n-------------------------------")
            secret_word, user_word, errors_counter = new_game(1)
print('End!')
