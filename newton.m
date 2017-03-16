function root = newton(a,f,df,tol)

b = a - f(a)/df(a);
err = abs(f(b));
counter = 0;
while err > tol
    a = b;
    b = a - f(a)/df(a);
    err = abs(f(b))
    counter = counter + 1;
    
end

counter
root = b
    

