root_bisection = bisection(-1,4,@set3fun4mult,0.0001)
%root_secant = secant(-1,1,@fun1,0.0001)
%root_newton = newton(1.5,@set3fun2,@set3dfun2,0.0001)

%root_fixedpt = fixedpoint(1.2,@fun5,@rfun3,0.0001)