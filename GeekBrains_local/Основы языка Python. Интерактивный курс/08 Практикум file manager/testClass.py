"""
def get_current_directory(self):
    from os import getcwd
    if len(self.file) == 0:
        current_dir = getcwd()
        print(f'\n{current_dir}')
    else:
        print(f'{self.file}')

    def check_type(self):
    if self.file:
        from os import path
        if path.isfile(self.file):
            obj_type = 'file'
        elif path.isdir(self.file):
            obj_type = 'dir'
    else:
        obj_type = 'unknown'
    return obj_type
"""

a = 'testClass.py'


def check(a):
    answer = True
    from os import path
    if path.exists(a):
        while answer:
            answer = input(f'Перезаписать {a} (Y(да)\\N(нет)\\Q(выход))?').lower()
            if answer in ('y', 'n', 'q'):
                answer = False
            else:
                answer = True
    else:
        pass


check(a)
