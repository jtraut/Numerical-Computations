function extrapolation = linear_extrapolation(x1,y1,x2,y2,x)

if x1 < x2
    if x >= x1 && x <= x2
        extrapolation = ('x must be outside x1 and x2');
        return;
    end
elseif x1 > x2 
    if x <= x1 && x >= x2
        extrapolation = ('x must be outside x1 and x2');
        return;
    end
end

extrapolation = ((x2 - x)*y1 + (x - x1)*y2)/(x2 - x1)
end 