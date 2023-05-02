function [fX, fY, slope, intercept, Rsquared] = linearRegression(x,y)
%linearRegression Computes the linear regression of a data set
%   Compute the linear regression based on inputs:
%     1. x: x-values for our data set
%     2. y: y-values for our data set
%
%   Outputs:
%     1. fX: x-values with outliers removed
%     2. fY: y-values with outliers removed
%     3. slope: slope from the linear regression y=mx+b
%     4. intercept: intercept from the linear regression y=mx+b
%     5. Rsquared: R^2, a.k.a. coefficient of determination
if length(x) ~= length(y);
    error('The inputs are not equal in length');
end
%Sort data
[sorted_y, sort_idx] = sort(y);
sorted_x = x(sort_idx);

%Compute the quartiles
n = length(y);
Q1_idx = floor(0.25*n) + 1;
Q3_idx = floor(0.75*n) + 1;
Q1 = sorted_y(Q1_idx);
Q3 = sorted_y(Q3_idx);
IQR = Q3 - Q1;

%Remove the outliers
Lower_threshold = Q1 - 1.5*IQR;
Upper_threshold = Q3 + 1.5*IQR;
outlier_mask = (sorted_y < Lower_threshold) | (sorted_y > Upper_threshold);
fX = sorted_x(~outlier_mask);
fY = sorted_y(~outlier_mask);


%Compute the linear regression
x_mean = mean(fX);
y_mean = mean(fY);
Sxx = sum((fX - x_mean).^2);
Sxy = sum((fX - x_mean).*(fY - y_mean));
m = Sxy/Sxx;
b = y_mean - m*x_mean;

%Compute the R-squared value
y2 = m*fX + b
SS_res = sum((fY - y2).^2);
SS_tot = sum((fY - y_mean).^2);
Rsquared = 1 - SS_res/SS_tot

intercept = b
slope = m

    

end