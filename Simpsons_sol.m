function Simp = Simpsons_sol(x,y,x1,x2,h)
xr = round(x,5);
sigma1 = 0;
sigma2 = 0;
index = find(xr == x1,1);
stop = find(xr == x2,1);
step = h/(x(2) - x(1));
for i = round(index + step):round(2*step):round(stop - step)
sigma1 = sigma1 + y(i);
end
for k = round(index + 2*step):round(2*step):round(stop - 2*step)
sigma2 = sigma2 + y(k);
end
Simp = h/3*(y(index) + y(stop) + 4*sigma1 + 2*sigma2);
end
