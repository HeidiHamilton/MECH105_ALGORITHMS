function [root, fx, ea, iter] = falsePosition(func, xl, xu, es, maxit, varargin)
%falsePosition finds the root of a function using false position method
% input:
%   func = function being evaluated
%   xl, xu = lower and upper guesses
%   es = desired relative error (default = 0.0001%)
%   maxit = maximum allowable iterations(default = 200)
% output:
%   root = root estimate
%   fx = function value at root estimate
%   ea = approximate relative error (%)
%   iter = number of iterations

%Set default iterations and relative error
if nargin < 3, error('atleast three inputs needed'),end
    test = func(xl,varargin{:})*func(xu, varargin{:});
if test > 0, error('no sign change'), end
if nargin < 4, es = 0.0001, end
if nargin < 5, maxit = 200,end
iter = 0;
xr = xl;
ea = 100;
while ea > es && iter < maxit
    xrold = xr;
%False position equation
    xr = xu - (func(xu)*(xl-xu))/(func(xl)-func(xu));
iter = iter + 1;
if xr ~= 0
%relative error equation    
    ea = abs((xr - xrold)/xr)*100;
end
if func(xr)*func(xl) < 0
    xu = xr;
elseif func(xr)*func(xu) < 0
    xl = xr;
else
    ea = 0;
end

end
%Outputs
root = xr;
fx = func(xr);
end
