function [L, U, P] = luFactor(A)
% luFactor(A)
%	LU decomposition with pivotiing
% inputs:
%	A = coefficient matrix
% outputs:
%   Determine the size of the matrix
n = size(A,1);
%	L = lower triangular matrix
L = eye(n);
%	U = upper triangular matrix, give it an initial value
U = A;
%   P = the permutation matrix, starts as identity matrix
P = eye(n);
[rows,columns] = size (A);
% Make sure the matrix is a valid matrix
if rows ~= columns
errorCheckDetected = error('error');
else 
errorCheckDetected = 0;
end

for k = 1:n-1
    % Partial pivoting
    [max_val,idx] = max(abs(U(k:n,k)));
    pivot_idx = idx+k-1;
    if pivot_idx ~= k
        % Swap rows in U and P
        U([k,pivot_idx],:) = U([pivot_idx,k],:);
        P([k,pivot_idx],:) = P([pivot_idx,k],:);
        if k > 1
            L([k,pivot_idx],1:k-1) = L([pivot_idx,k],1:k-1);
        end
    end
    % Gaussian elimination
    for i = k+1:n
        factor = U(i,k)/U(k,k);
        L(i,k) = factor
        U(i,k:n) = U(i,k:n) - factor*U(k,k:n)
    end
end
if P*A ~= L*U
    error('Invalid results')
end
end