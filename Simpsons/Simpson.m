function [I] = Simpson(x, y)
% Numerical evaluation of integral by Simpson's 1/3 Rule
% Inputs:
%   x = the vector of equally spaced independent variable values
%   y = the vector of function values with respect to x
% Outputs:
%   I = the numerical integral calculated

    % Check if x and y are equal length
if numel(x) ~= numel(y)
        error('Input vectors x and y must have the same length.');
    end

    % Check if x is equally spaced
    h = x(2) - x(1);
    if any(abs(diff(x) - h) > eps(max(x)) * numel(x))
        error('X values are not equally spaced');
    end

    % Check for odd number of intervals and issue a warning
    n = numel(x) - 1;
    if mod(n, 2) ~= 0
        warning('Trapezoidal rule will be used for the last interval.');
    end

    % Initialize I value
    I = 0;

    
    % Simpson's 1/3 rule for even number of intervals
    for i = 1:2:n-2
        I = I + ((h / 3) * (y(i) + 4 * y(i+1) + y(i+2)));
    end
    
    % Use trapezoidal rule for the last interval
    if mod(n, 2) ~= 0
        I = I + ((h / 2) * (y(end-1) + y(end)));
    end

end