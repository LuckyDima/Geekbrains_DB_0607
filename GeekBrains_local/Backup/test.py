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

circle((0,-200),'',200)
phi = 360 / 7
r = 70
for i in range(0,7):
        fpi_rad = phi * i * math.pi / 180
            # circle((math.sin(fpi_rad*i)*r, math.cos(fpi_rad*i)*r),'white',r)
        turtle.goto(math.sin(fpi_rad*i)*r, math.cos(fpi_rad*i)*r)
        turtle.pencolor('red')
        turtle.circle(50)
        turtle.exitonclick() #Выход по клику на экране

