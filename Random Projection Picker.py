# simple projectile pesudo-random selector - By marcus thorpe
# the suffix works up to 20. could eb expanded but unlikley to have that many projectiosn
import random
numbOfProjections = 10 # change to number of projections
suffix = ''
outP =random.randint(1,numbOfProjections)

if outP == 1:
    suffix = 'st'
elif outP == 2:
    suffix = 'nd'
elif outP == 3:
    suffix = 'rd'
else:
    suffix = 'th'
print('Read the ' + str(outP) +str(suffix) + ' value clockwise')
