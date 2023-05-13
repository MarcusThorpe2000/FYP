#!/usr/local/bin/python3
# random dot cell picker - By Marcus Thorpe
# put in same file path as image, program converts mono channel images (grey -> colour)
# so that dots can be added
# vars to tweek are marked below imports as CHANGE ME
# all dots will show at once, if you would like one at a time, un comment the line
# non overlapping will prevent dots on the same X OR y line
# this is a non issue with the resolution and scale this would occour at.
# press any key to continue, image saved as result regardless.

import cv2
import random

# CHANGE ME
numberOfDots = 25 # max theretical limit is approx 1000
rad = 5
col = (0, 0, 255)
thickN = -1
# End CHANGE ME
imgPre = cv2.imread('RandImg.jpg', 0)  # import mono-channle image
img = cv2.merge((imgPre, imgPre, imgPre))  # convert to colour for dots to be red
cv2.imshow('img', img)  # show image to screen and wait for key press
cv2.waitKey(0)

sX, sY, overFlow = dimensions = img.shape  # get image size in sX and sY
print(str(sX) + ' x ' + str(sY))


def updateImg(nX, nY):
    image = cv2.circle(img, (nY, nX), rad, col, thickN)
    cv2.imshow('img', img)
    # cv2.waitKey(0) # un comment this to do one by one frames

HoldListx = []
HoldListy = []
count = 0
while (count <= numberOfDots):
    x = random.randint(1, sX)
    y = random.randint(1, sY)

    if (x in HoldListx) or (y in HoldListy):
        print('duplicate val')
        # we dont incrument count, just let it run again, no CV draw.
    else:
        HoldListx.append(x) # adds cords to black list
        HoldListy.append(y)
        print(x, y)
        updateImg(x, y)
        count = count + 1
        # dot added now, loop counts one more

cv2.waitKey(0)

# Save
cv2.imwrite("result.png", img)


