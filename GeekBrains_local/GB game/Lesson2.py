#code utf-8

print("Hi! I'm Python");

name = input("How is your name? ");

print(name,"hello in Python World!");

answer = input("Do you want to work whit me? (Y/N) ");

#PEP-8
if answer == {'Y','y'}:
	print ("You are welcome.")
elif answer == 'N':
	print ("Good buy.")
else:
	print("Not good answer. Please, choose something from the list:")
print ("1 - write a code;")
print ("2 - whatch a movie;")
print ("3 - play cheese;")
print ("4 - going to bed;")
print ("5 - nothing;")
choice =  input();
if choice == '1':
	print("Uuuhuuu! Common guy!")
elif choice == '2':
	print("Open your browser")
elif choice == '3':
	print("I can't do it now")
elif choice == '4':
	print("Ok! Go away!")
elif choice == '5':
	print("You are lazy guy")
else:
	print("Oh my God. Good buy")
	pass
