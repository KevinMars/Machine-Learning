from ThinkStats import *
import math

def Pumpkin():
		
	
	return Mean(values), Var(values), math.sqrt(Var(values))

values = raw_input("Enter The values (without commas): ").split()

values = map(int, values)

print Pumpkin()

