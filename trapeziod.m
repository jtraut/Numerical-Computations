function integral = trapeziod(x,y,x1,x2,h)
%x and y vectors holding corresponding data points 
%x1 and x2 lower and upper bounds for integration 
%h is step size 

n = length(x);
if(n ~= length(y))
    integral = ('do not have pairs of x and y values');
    return
end 
%check for evenly spaced data
for i = 0:(n-2)
    space1 = abs(x(i+1) - x(i));
    space2 = abs(x(i+2) - x(i+1));
    if(space1 ~= space2)
        integral = ('data not evenly spaced');
    end
end
%check if the given bounds are valid
lowermatch = 0; 
uppermatch = 0;
for i = 0:n-1
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
if(rem(h,space1) ~= 0)
    integral = ('h not a valid step size');
    return
end 
%good to go, compute the integral via trapezoidal method
integral = 0;
for i=x1:h:x2
    integral = integral + h/2*(y(i+h)+y(i));
end
end