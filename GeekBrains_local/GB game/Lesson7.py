import turtle
import random
import math

turtle.ht()
turtle.speed(0)
turtle.title("Игра русская рулетка")

def circle(start_point,color,radius):
    turtle.pencolor(color)
    turtle.penup()
    turtle.goto(start_point)
    turtle.pendown()
    turtle.fillcolor(color)
    turtle.begin_fill()
    turtle.circle(radius)
    turtle.end_fill()

answer = ''

while answer != 'n':
    answer = turtle.textinput('Играем?','Y/N')
    if answer.lower() == 'y':
        circle((0,-130),'black',180)
        phi = 360 / 7
        r = 120
        bullet = random.randrange(0,7) #Получаем случайное число от 0 до 6
        for i in range(0,7):
            fpi_rad = phi * i * math.pi / 180
            if i != bullet: #Закрашиваем пулю
                color = 'white'
            else:
                color = 'yellow'
            circle((math.sin(fpi_rad)*r, math.cos(fpi_rad)*r),color,50)
        turtle.exitonclick() #Выход по клику на экране
    else:
        pass

