function [A] = specialMatrix(n,m)
% This function should return a matrix A as described in the problem statement
% Inputs n is the number of rows, and m the number of columns
% It is recomended to first create the matrxix A of the correct size, filling it with zeros to start with is not a bad choice
% n = number of rows
% m = number of columns
% Outputs:
% A = n x m matrix
% Check that there are two input variables
if nargin ~= 2
    error('Please input exactly two variables, number of rows and columns')
end
% Start with a zeros matrix
A = zeros(n,m);
% Now the real challenge is to fill in the correct values of A
% Make first row have values aligned with column
A(1,:) = 1:m;
% Make first column have values aligned with row
A(:,1) = 1:n;
% Assign rest of matrix values matching criteria
for i = 2:n
    for j = 2:m
        A(i,j) = A(i-1,j) + A(i,j-1);
    end
end
