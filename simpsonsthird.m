function integral = simpsonsthird(x,y,x1,x2,h)
%x and y vectors holding corresponding data points 
%x1 and x2 lower and upper bounds for integration 
%h is step size 

n = length(x);
if(n ~= length(y))
    integral = ('do not have pairs of x and y values');
    return
end 
%check for evenly spaced data
for i = 1:(n-2)
    space1 = abs(x(i+1) - x(i));
    space2 = abs(x(i+2) - x(i+1));
    if(space1 ~= space2)
        integral = ('data not evenly spaced');
    end
end
%check if the given bounds are valid
lowermatch = 0; 
uppermatch = 0;
for i = 1:n
    if(x1 == x2)
        integral = ('not valid limits of integration');
        return 
    end
    if(x1 == x(i))
        lowermatch = 1;
    end
    if(x2 == x(i))
        uppermatch = 1;
    end
end
if(lowermatch == 0 || uppermatch == 0)
    integral = ('not valid limits of integration');
    return 
end
%check for valid step size 
multiple = h / space1;
if(ceil(multiple) ~= floor(multiple))
    integral = ('h not a valid step size');
    %return
end 
%check if have correct number of points to divide to thirds
if(rem(n,3) ~= 0)
    integral = ('invalid data for Simpsons 1/3 rule');
    return
end
%good to go, compute the integral via Simpson's 1/3 rule
integral = 0;
one = 1;
multiple = round(multiple);
for i=1:n
    two = one+multiple;
    three = two+multiple;   
    if(x(i) == x1) 
        two = i+multiple;
        three = two+multiple; 
        simpsons = (h/3)*(y(i) + 4*y(two) + y(three))
        integral = integral + simpsons;
        one = three;
    elseif(three <= n && x(one) > x1 && x(three) <= x2)       
        simpsons = (h/3)*(y(one) + 4*y(two) + y(three))
        integral = integral + simpsons;
        one = three;
    end
end
end