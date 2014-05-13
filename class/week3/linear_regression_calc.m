%http://www.mathworks.com/help/matlab/data_analysis/linear-regression.html

%calculate the coefficient of determination, r-square

% rsq = 1 - SSresid / SStotal

y=[20,32,28,44,76,65,97,121,140,160]
x=1:length(y)
[p,S,mu] = polyfit(x,y,1)
p = polyfit(x,y,1)

%p shows 15.9333   -9.3333
%This means,
%y = ax + b
%a is 15.9333 and b is -9.3333
%y = 15.9333 * x + -9.3333

%Call polyval to use p to predict y, calling the result yfit:

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

