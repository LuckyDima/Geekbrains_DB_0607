#code utf-8
import os
import psutil
import shutil
import platform
import locale

print("Hi! I'm Python",str(platform.python_version()))

name = input("How is your name?\n")

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
        print("""
=========---------You are welcome!---------=========
I can do:
[1] - Show file list
[2] - Show current pids
[3] - Show sys info
[4] - Duplicate file
[5] - Your file duplicating in
[6] - Delete file"""
              )
        do = input()
        try: do = int(do)
        except:
            while type(do) is not int:
                print("""
Supporting only numeric values. Please again.
[1] - Show file list
[2] - Show current pids
[3] - Show sys info
[4] - Duplicate all files
[5] - Your file duplicating in
[6] - Delete file""")
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
        elif do == 4:
            file_list = os.listdir()
            i = 0
            while i < len(file_list):
                new_file = file_list[i] + '.dupl'
                shutil.copy(file_list[i],new_file) #Copying old file to new with extension dupl
                i += 1
        elif do == 5:
            print("With file do you want copy?\n")
            file_list = os.listdir()
            i = 0
            while i < len(file_list):
                new_file = "[" + str(i) + "] -" + str(file_list[i])
                print(new_file)
                i +=1
            do = int(input())
            shutil.copy(file_list[do], file_list[do] + ".dupl")
            print('file ' + file_list[do] + ' was copied to file', file_list[do] + ".dupl")
        elif do == 6:
            print("Enter a name of directory for delete:")
            del_dir = input()
            if del_dir == '':
                del_dir = os.path.dirname(os.path.realpath(__file__))
                print("The current dirictory was choised by default:", del_dir)
            else:
                print("You set",del_dir,"directory")
            del_approve = 'n'
            while del_approve.lower() != 'y':
                print("Do you want delete all files with extension .dupl from", del_dir, "(Y/N)")
                del_approve = input().lower()
                del_mask = '*.dupl'
                if del_approve.lower() == 'n':
                    print("Enter new name of directory, please.(Y/Q - exit)")
                    del_approvel = input().lower()
                    if del_approve.lower() == 'q' or del_approve.lower() != 'y':
                        break
                    else:
                        del_approve = input().lower()
                del_files = [f for f in os.listdir() if f.endswith('.dupl')]
                i = 0
                while i < len(del_files):
                    del_file = del_files[i]
                    os.remove(del_file)
                    print("File",del_files[i] + ' was deleted')
                    i += 1
    else:
        print("Repeat your answer again...")
