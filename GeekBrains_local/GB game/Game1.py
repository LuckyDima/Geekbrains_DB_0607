import random

def new_game():
    words_list = (  'автострада', 'бензин', 'инопланетянин',
                    'самолёт', 'библиотека', 'шайба', 'олимпиада',
                    'чемпионат', 'клён'
                )
    secret_word = random.choice(words_list).replace('ё','е')
    user_word = ['*'] * len(secret_word)
    return list(secret_word),list(user_word)

def again():
    print("You are win!\nDo you want to play again? (Y/N)")
    answer = input()
    if answer.lower() != 'y':
        exit()
    else:
        errors_counter = 0
        secret_word, user_word == new_game()
    return list(secret_word),list(user_word)

errors_counter = 0
secret_word, user_word = new_game()
print(''.join(user_word))

while True:
    letter = input('Your letter: \n').lower()
    if 'ё' in letter:
        letter = letter.replace('ё','е')
    if len(letter) != 1 or not letter.isalpha():
        continue
    if letter in secret_word:
        for position,symbol in enumerate(secret_word):
            if letter == symbol:
                user_word[position] = letter
                if '*' not in user_word:
                    secret_word, user_word = again()
                    continue
    else:
        errors_counter += 1
        print('\tAll errors:', errors_counter)
        if errors_counter == 8:
            print("-------You are lost-------")
            break
    print(''.join(user_word))
print('End!')
