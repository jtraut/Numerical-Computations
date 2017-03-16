function ode = trapezoidal_lorenz(xyz, h, N)
%xyz holds the initial  x y z values
%h is the time step size
%N is the number of time steps to take 

x = []; y = []; z = []; t = [];
%fill in dynamic arrays with initial conditions 
x(1) = xyz(1);
y(1) = xyz(2);
z(1) = xyz(3);
t(1) = 0;

for i = 2:N  
    t(i) = t(i-1) + h; %keep track of actual times
    %and update associated position values for "time t"
    xfe =  x(i-1) + h*(16*(y(i-1) - x(i-1)));
    yfe =  y(i-1) + h*(45*x(i-1) - y(i-1) -x(i-1)*z(i-1));
    zfe =  z(i-1) + h*(x(i-1)*y(i-1) - 4*z(i-1));
    
    x(i) = x(i-1) + h/2*(16*(y(i-1)-x(i-1)) + (16*(yfe - xfe)));
    y(i) = y(i-1) + h/2*(45*x(i-1)-y(i-1)-x(i-1)*z(i-1) + (45*xfe - yfe - xfe*zfe));
    z(i) = z(i-1) + h/2*(x(i-1)*y(i-1)-4*z(i-1) + (xfe*yfe - 4*zfe));
end

%plot(t,x)
%title('Trapezoidal Method on Lorenz equations time-domain');
plot3(x, y, z)
title('Trapezoidal Method on Lorenz equations State-Space');
ode = ('check the plot');

end