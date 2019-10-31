#code utf-8
import os
import psutil
import shutil
import platform
import locale

def show_menu():
    print("""
[1] - Show file list
[2] - Show current pids
[3] - Show sys info
[4] - Duplicate all files
[5] - Your file duplicating in
[6] - Delete duplicate files in directory
""")

def sys_info(get_login = 0):
    if get_login == 0:
        print('SYSTEMINFO: \nOS: '
        + platform.uname().system + ' ' + platform.uname().release
        + '(Code Page: ' + locale.getpreferredencoding()
        #+ str(locale.getlocale()[0])
        + ')'
        + '\nBuild: '+ str(platform.uname().version)
        + '\nCPU Count: ' + str(psutil.cpu_count()) + '(' + platform.uname().machine
        + ' ' + str(int(psutil.cpu_freq().max)) + 'MHz)'
        + '\nMemory: Total:' + str(psutil.virtual_memory().total)
        + ' (Used:' + str(psutil.virtual_memory().percent) + '%)'
        + '\nCurrent Login: ' + os.getlogin() + ' (PID: ' + str(os.getpid()) + ')'
        + '\nCurrent Directory: ' + os.path.dirname(os.path.realpath(__file__))
        )
    elif get_login == 1:
        return os.getlogin()

# def cls():
#     os.system('cls' if os.name=='nt' else 'clear')

def check_file(dir_name='', file_name='' ,ext_name='.dupl'):
    if dir_name == '' or file_name == '':
        exit()
    else:
        path_full = dir_name + '\\' + file_name + ext_name
        if os.path.exists(path_full):
            return True
        else:
            return False

def check_del_dir(del_dir):
    if del_dir == '':
        return os.path.dirname(os.path.realpath(__file__))
    else:
        return del_dir

def current_dir():
    return os.path.dirname(os.path.realpath(__file__))

def duplicate_file(file):
    shutil.copy(file, file + ".dupl")
    if check_file(current_dir(),file):
        print('file ' + file + ' was copied to file', file + ".dupl")
    else:
        print("- - - - - - Error - - - - - -")

def delete_file(del_dir):
    count = 0
    file_list = os.listdir(del_dir)
    for f in file_list:
        fullname = os.path.join(dir_name,f)
        if fullname.endswith('.dupl'):
            os.remove(fullname)
            if not os.path.exists(fullname):
                count += 1
                print("File", f,'was deleted from',dir_name)
    return ('Total files deleted: ' + str(count))

print("Hi! I'm Python",str(platform.python_version()))

name = sys_info(1)

print(name,"Hello in Python World!\n")

answer = ''
while answer.lower() != 'q':
    answer = input("Do you want to work whit me? (Y/N/Q) \nY-yes N-No Q-Exit\n")
    if answer.lower() == 'n':
        print("Good buy.")
        exit()
    elif answer.lower() == 'q':
        exit()
    elif answer.lower() == 'y':
        show_menu()
        do = input()
        try: do = int(do)
        except:
            while type(do) is not int:
                print("""Supporting only numeric values. Please again.""")
                show_menu()
                try: do = int(input())
                except: print("It's no integer")
        if do == 1:
            file_list = os.listdir()
            i = 0
            while i < len(file_list):
                print(str(file_list[i]))
                i +=1
        elif do == 2:
            print(psutil.pids())
        elif do == 3:
            sys_info()
        elif do == 4:
            file_list = os.listdir()
            i = 0
            while i < len(file_list):
                if os.path.isfile(file_list[i]):
                    duplicate_file(file_list[i])
                i += 1
        elif do == 5:
            print("With file do you want copy?\n")
            file_list = [f for f in os.listdir() if os.path.isfile(f)] #Show only files
            i = 0
            while i < len(file_list):
                new_file = "[" + str(i) + "] -" + str(file_list[i])
                print(new_file)
                i += 1
            do = int(input())
            duplicate_file(file_list[do])
        elif do == 6:
            print("Delete file in directory\n")
            dir_name = input("Enter a directory name:\n")
            dir_name = check_del_dir(dir_name)
            print(delete_file(dir_name))
    else:
        print("Repeat your answer again...")
