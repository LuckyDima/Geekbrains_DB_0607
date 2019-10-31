#code utf-8

import os
import psutil


print("Hi! I'm Python");

#name = input("How is your name? ");

#print(name,"hello in Python World!");

#answer = input("Do you want to work whit me? (Y/N) ");

#PEP-81

#if answer == {'Y','y'}:
#	print ("You are welcome.")
#elif answer == 'N':
#	print ("Good buy.")
#else:
#	print("Not good answer. Pleas11e, choose something from the list:")
print ("[1] - Show a file list")
print ("[2] - Show a system info")
print ("[3] - Get SPID")

do =  int(input("Enter a number:  "));
if do == 1:
    print(os.listdir())
elif do == 2:
	print(os.name)
	print(os.path)
elif do == 3:
	print(psutil.pids())
else:
	print("N/A")
	pass
