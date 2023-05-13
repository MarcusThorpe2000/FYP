# changing vars
lengS = 50 # scale bar length in px
SCx = 25 # scale bar x
SCy = 30 # scale bar y
k = 1 # fixed gain
# end editables
from turtle import * # import libs
import turtle as turtle
import pandas as pd


color('red') # set colour, screen dimentions, and pen width
height = 900
width = 800
screen = Screen()
screen.setup(width, height)
turtle.width(3)

data = pd.read_csv("book.csv") # read cvs, 2 colum vetors, with x and y as the first A1,B1 data points.

# converting column data to list
xc = data['x'].tolist() # converts CSV to lists
yc = data['y'].tolist()

xStart = xc[0] # normlises all data to root
yStart = yc[0]



n = len(xc) # loop set up
x=0
while x < n:
    xc[x] = (xc[x] - xStart)*k
    yc[x] = (yc[x] - yStart)*k
    x = x + 1

print(xc) # print arrays for diagnostics
print(yc)
print(xc)

def draw(x,y): # draw sub
    goto(x, y)
    return

def drawScale(sc,sy,leng): # scale bar sub
    penup()
    goto(sc*k,sy*k)
    pendown()
    goto((sc-leng)*k,sy*k)
    penup()
    return


t=1 # loop 2 - drawing
while t <= n:
    if t <=2: # colour selector
        color('green')
    elif t == n:
        color('red')
    else:
        color('black')
    print(t)
    #print(xc[x]) # thurther diagnostics
    #print(yc[x])

    draw(xc[t-1],yc[t-1])
    t = t + 1
    if t == n:
        color('black')


drawScale(SCx,SCy,lengS) # calls scale method
done() # finished




