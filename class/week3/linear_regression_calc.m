%
% See Core Data Analysis Week 3 video.
% 3.3 Correlation and determinacy coefficients: properties and meaning 
% see equations.png and equations2.png!
%
% the second part is from the exable below.
% http://www.mathworks.com/help/matlab/data_analysis/linear-regression.html
%
% calculate the coefficient of determination, r-square
%
% y = a * x + b
% a is the slope
%
% r = a * std(x) / std(y)
% r^2
%
% or 
%
% rsq = 1 - SSresid / SStotal
% (see part 2 below)

y=[20,32,28,44,76,65,97,121,140,160]
x=1:length(y)
%[p,S,mu] = polyfit(x,y,1)
p = polyfit(x,y,1)

%p shows 15.9333   -9.3333
%This means,
%y = ax + b
%a is 15.9333 and b is -9.3333
%y = 15.9333 * x + -9.3333

%-------- Shortcut for getting rho (part 1) ----------
cof=p(1) * std(x) / std(y)

%rho sqare = determinicy cof 
% this should be matching rsq at the end!!!
cof^2
%--------------------------------------------

%-------- Another way to calculate using polyval via fitting line (part 2) ----------
%Call polyval to use p to predict y, calling the result yfit:
% the polyval below does calculate
% yfit =  p(1) * x + p(2);
% yfit = a * x + b
yfit = polyval(p,x);


%Compute the residual values as a vector signed numbers:

yresid = y - yfit;

%Square the residuals and total them obtain the residual sum of squares:

SSresid = sum(yresid.^2);

%Compute the total sum of squares of y by multiplying the variance of y by the number of observations minus 1:

SStotal = (length(y)-1) * var(y);

%Compute R2 using the formula given in the introduction of this topic:

rsq = 1 - SSresid/SStotal


%rsq =    0.9326

%which is 93.26%

