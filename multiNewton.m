function roots = multiNewton(a,iter)
%a is initial guess vector for (u,v,w)
%F is matrix of set of nonlinear equations
%DF is the jacobian matrix 

function f = F(u,v,w)
f = [2*u^2-4*u+v^2+3*w^2+6*w+2; 
            u^2+v^2-2*v+2*w^2-5;
            3*u^2-12*u+v^2+3*w^2+8];
end

function df = DF(u,v,w)
df = [4*u-4 2*v 6*w+6; 2*u 2*v-2 4*w; 6*u-12 2*v 6*w];
end

step = 1
s = gaussian(DF(a(1),a(2),a(3)),-F(a(1),a(2),a(3)));
b = a + s

for i = 1:iter
    step = step + 1
    a = b;
    s = gaussian(DF(a(1),a(2),a(3)),-F(a(1),a(2),a(3)));
    b = a + s
end

u = b(1);
v = b(2);
w = b(3);
roots = b;
end
    