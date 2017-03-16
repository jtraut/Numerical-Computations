matrixA = [-11 3 3; -2 -5 1; 1 -10 8];
ab = [18; -3; 5];
inv(matrixA);
%solutionA = gaussian(matrixA, ab)

matrixB = [0.16 0.85 0.34; -0.25 -1.5 0.50; 1.03 5.46 1.77];
bb = [0.27; -0.21; 1.75];
inv(matrixB);
%solutionB = gaussian(matrixB, bb)

matrixC = [-2 1 -4; 7 -3 1; 3 -1 -7];
cb = [3; -1; -7];
inv(matrixC)
%solutionC = gaussian(matrixC, cb)