import turtle
import random
import math

turtle.ht()
turtle.speed(-10)
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

def baraban_empty(color='white',r = 120):
    circle((0,-130),'black',180)
    for i in range(0,7):
        fpi_rad = phi * i * math.pi / 180
        circle((math.sin(fpi_rad)*r, math.cos(fpi_rad)*r),color,50)

phi = 360 / 7
answer = ''
start = 0
r = 120
lost = 0

baraban_empty()

while answer.lower() != 'n':
    answer = turtle.textinput('Играем?','Y/N')
    if lost != 0:
        turtle.undo() #Очищаем строку вы проиграли через буфер черепахи
    if answer.lower() == 'y':
        var = range(start,random.randrange(7+start,14+start))
        print(var)
        for i in var:
            fpi_rad = phi * i * math.pi / 180
            color = 'yellow'
            circle((math.sin(fpi_rad)*r, math.cos(fpi_rad)*r),color,50)
            if i == 0:
                turtle.resizemode("auto")
                turtle.textinput('Револьвер заряжен!','Крутим?              Y/N')
            color = 'white'
            circle((math.sin(fpi_rad)*r, math.cos(fpi_rad)*r),color,50)
        color = 'yellow'
        circle((math.sin(fpi_rad)*r, math.cos(fpi_rad)*r),color,50)
        start = i % 7
    if start == 0 and answer.lower() == 'y':
        turtle.penup()
        turtle.goto(0,-180)
        turtle.pencolor('red')
        turtle.write('Вы проиграли!',font=('Times',28,'bold italic'),align='center')
        lost = 1
        #turtle.exitonclick() #Выход по клику на экране
    else:
        pass

