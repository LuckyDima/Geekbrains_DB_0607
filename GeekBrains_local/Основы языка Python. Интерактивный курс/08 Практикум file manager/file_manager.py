class File:
    def __init__(self, name='', file_text='', file_extension='txt'):
        self.text = file_text
        self.file = name
        self.type = file_extension

    def check_exists(self):
        answer = True
        from os import path
        if path.exists(self.file):
            while answer not in ('y', 'n', 'q'):
                answer = input(f'Перезаписать {self.file} (Y(да)\\N(нет)\\Q(выход))?').lower()
        else:
            answer = 'y'
        return answer

    def check_extension(self):
        if '.' not in self.file:
            self.file = f'{self.file}.{self.type}'

    def create_file(self):
        File.check_extension(self)
        a = File.check_exists(self)
        a = a.replace('y', 'w').replace('n', 'a')
        if a in ('w', 'a'):
            with open(self.file, f'{a}', encoding='utf-8') as f:
                f.write(f'{self.text}')
        else:
            pass

    def delete_file(self):
        from os import path
        if path.exists(self.file):
            from os import remove
            remove(self.file)
        else:
            print(f'Файл {self.file} не найден.')


if __name__ == '__main__':
    MyClass = File('new_file','1')
    MyClass.create_file()
    MyClass.delete_file()
    File.delete_file('new_file')
    # MyClass.check()
