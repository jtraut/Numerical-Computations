function fun = f(x)
fun = sin(x) + 0.25;

a = -1;
b = 1;
tol = .0001;

bisection(a,b,@f,tol)