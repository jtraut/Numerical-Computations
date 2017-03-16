function [xspline, yspline] = cubic_spline(X,Y)
%X vector for x values
%Y vector for y values
%computes and plots cubic spline from data points

[n,m] = size(X);
[col,row] = size(Y);

if [n,m] ~= [col,row]
   % splines = ('Invalid data input, must be pairs of x,y');
    return;
end

A = zeros(n);
v = zeros(n,1);
A(1,1) = 1; A(n,n) = 1;
v(1) = 0; v(2) = 1;
dx = zeros(n-1,1);
dy = zeros(n-1,1);
%compute the deltas
for i = 1: n-1
    dx(i) = X(i+1)-X(i);
    dy(i) = Y(i+1)-Y(i);
end

%fill in matrix A, and vector v
for i=2:n-1
    A(i,i-1:i+1) = [dx(i-1) 2*dx(i-1)+2*dx(i) dx(i)];
    v(i) = 3*(dy(i)/dx(i)-dy(i-1)/dx(i-1));
end 

%set up S(x) equations, requires coeffs b, c, d
b = zeros(n,1);
c = zeros(n,1);
d = zeros(n,1);
%solve to get c coeffs 
c = A\v;
for i = 1:n-1
    b(i) = dy(i)/dx(i)-dx(i)/3*(2*c(i)+c(i+1));
    d(i) = (c(i+1)-c(i))/(3*dx(i));
end
%plot points for reference
xspline=[]; yspline=[];
%spline equations
j = 1;
for i=1:n-1
    S = @(x) Y(i) + b(i)*(x-X(i)) + c(i)*(x-X(i)).^2 + d(i)*(x-X(i)).^3;
    for x=X(i):.5:X(i+1);
       j = j+1; 
       xspline(j) = x;
       yspline(j) = S(x);
    end
end
%plot(X,Y,'o',xspline,yspline)
%title('Cubic Spline Interpolant')
%splines = ('Check the plot');
xspline;
yspline;
end