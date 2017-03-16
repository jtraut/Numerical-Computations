import numpy
from numpy import linalg as LA

#returns the solution to the system at a given point
def f(x):
	u = x[0]
	v = x[1]
	w = x[2]

	return [2*(u**2) -4*u + v**2 + 3*(w**2) + 6*w + 2, u**2 + v**2 -2*v + 2*(w**2) - 5, 3*(u**2) -12*u + v**2 + 3*(w**2) + 8]

#returns the Jacobian matrix evaluated at a given point
def j(x):
	u = x[0]
	v = x[1]
	w = x[2]

	return [[4*(u-1), 2*v, 6*(w+1)],[2*u, 2*(v-1), 4*w],[6*(u-2), 2*v, 6*w]]

def newton(x, tol):
	if(len(x) != 3):
		print "Initial guess must have 3 elements."
		return -1

	err = 1
	i = 0
	fx = f(x)	
	print "Step\tu\t\tv\t\tw"
	while (err > tol):
		jx = j(x)
		p = x - LA.solve(jx,fx)
		err = LA.norm(p-x, numpy.inf)
		x = p
		fx = f(x)
		if(i==0):
			print "{}\t{}\t{}\t\t{}".format(i, x[0], x[1], x[2])
		else:
			print "{}\t{}\t{}\t{}".format(i, x[0], x[1], x[2])
		i += 1
	return x

if __name__ == "__main__": 
	x = [1, 1, 1]
	newton(x, .0001)
