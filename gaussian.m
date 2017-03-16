function solution = gaussian(A,b)

%A is 3x3 matrix, b is the vector 
%Solves the linear system Ax = b

[m,n] = size(A);
[c,r] = size(b);

if [m,n] ~= [3,3]
    solution = ('Matrix dimension must be 3x3');
    return
elseif [c,r] ~= [3,1]
    solution = ('Vector must have length 3');
    return
end

x = zeros(3,1);

%P = [1 0 0; 0 1 0; 0 0 1];
%check for zeros in diagonal
if (A(1,1) == 0)
    P = [0 0 1; 0 1 0; 1 0 0];
    A = P * A;
    b = P * b;
elseif (A(2,2) == 0)
    P = [1 0 0; 0 0 1; 0 1 0];
    A = P * A;
    b = P + b;
end


%forward elimination
for j = 1:n-1 
    A;
    b;
    for i = j+1:n
        multiplier = A(i,j)/A(j,j);
        b(i) = b(i) - multiplier*b(j);
        for k = j:n
           A(i,k) = A(i,k) - multiplier*A(j,k);   
        end 
    end
end

A;
b;

%back substitution 
%check for zeros in diagonal
if (A(1,1) == 0 || A(2,2) == 0 || A(3,3) == 0)
    solution = ('Zero in diagonal, cannot divide by zero, no solution');
    return
end

x(3) = b(3)/A(3,3);
x(2) = (b(2) - A(2,3)*x(3))/A(2,2);
x(1) = (b(1) - A(1,2)*x(2) - A(1,3)*x(3))/A(1,1);

solution = x;       

