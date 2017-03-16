function root = fixedpoint(a,f,rf,tol)
%rf is the rearranged function

b = rf(a);
err = abs(f(b));
counter = 0;

while err > tol
    a = b;
    b = rf(a)
    err = abs(f(b));
    counter = counter + 1;
    if counter > 100
        b = ('Doesnt converge');
        err = 0.00000001
    end
end 

counter
root = b 