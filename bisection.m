function root = bisection(a,b,f,tol)

%initial guesses a and b for function f
%with tolerance tol 

%check if guesses are of opposite signs 
if f(a)*f(b) > 0 
    root = ('Guesses are of same sign; doesnt bracket root');
else
    c = (a + b)/2; %bisect
    err = abs(f(c)); 
    counter = 0;
    while err > tol
        if f(a)*f(c) > 0
            a = c;
        else 
            b = c;
        end
        c = (a + b)/2;
        err = abs(f(c))
        counter = counter + 1;
    end 
    
    counter
    root = c
end

    
