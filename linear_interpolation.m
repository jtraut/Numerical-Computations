function interpolation = linear_interpolation(x1,y1,x2,y2,x)

if x1 < x2
    if x <= x1
        interpolation = ('x must be between x1 and x2');
        return;
    elseif x >= x2
        interpolation = ('x must be between x1 and x2');
        return;
    end
elseif x1 > x2 
    if x >= x1
        interpolation = ('x must be between x1 and x2');
        return;
    elseif x <= x2
        interpolation = ('x must be between x1 and x2');
        return;
    end
end

interpolation = ((x2 - x)*y1 + (x - x1)*y2)/(x2 - x1)
end 