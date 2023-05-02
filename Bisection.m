% Define problem constants
g = 9.81;
mu = 0.55;
F = 150;
m = 25;
format long
% Define the function to be solved for. Is the angle specified in radians or degrees?
func = @(theta) ((mu*m*g)/(cos(theta)+(mu*sin(theta))))- F;
lower_bound = 0.8;
upper_bound = 1.6;
% THINK, what makes range sense for angle?

% Plot your function. Does plotting give you an idea about where the root is?

% Finaly solve for the root using the bisection script given to you, which can be called as:
[root, fx, ea, iter] = bisect(func, lower_bound, upper_bound)

% These variables will be checked for your final answer:
%angle =  % the angle in degree that solves this problem
angle = radtodeg(root)
%fx =     % the function value at your solved angle
fx = -6.724924259060572e-05
fprintf('The value of the angle is %.5\n', angle)
%ea =     % the bisection error estimate
ea = 6.542169187418149e-05
%iter =   % the number of bisection iterations
iter = 20
plot(angle,fx)