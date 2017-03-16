
xyz = [1,1,1];
h = 0.01;
N = 10000;

xyz = [1.01, 1.01, 1.01];

%OBE = forward_euler(xyz, h, N);

OBE2 = trapezoidal_lorenz(xyz, h, N);