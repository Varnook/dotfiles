import sys

direction =       sys.argv[1]
prevValue = float(sys.argv[2])

steps = { 
         "++" :  0.1 ,
         "--" : -0.1 ,
         "+"  :  0.01,
         "-"  : -0.01
        }

step = steps[direction]

newValue = prevValue + step

if newValue > 1:
    newValue = 1

if newValue < 0.01:
    newValue = 0.01

print(newValue)
