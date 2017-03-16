function root = secant(a,b,f,tol)

%initial guesses a and b for function f
%with tolerance tol 

c = b - f(b)*(a - b)/(f(a)-f(b)); %first guess
err = abs(f(c)); 
counter = 0;
while err > tol
    a = b;
    b = c;
    c = b - f(b)*(a - b)/(f(a)-f(b));
    err = abs(f(c))
    counter = counter + 1;
  
end

counter
root = c
