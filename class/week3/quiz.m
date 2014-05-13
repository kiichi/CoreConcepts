p = polyfit(x2,y2,1)
% a is   1.5000 b is   3.2000
% y = a * x + b

yfit = polyval(p,x2);
yresid = y2 - yfit;
SSresid = sum(yresid.^2);
SStotal = (length(y2)-1) * var(y2);
rsq = 1 - SSresid/SStotal


plot(x2,y2,'ro')
hold on
plot(x2,yfit)


% p =
% 
%     1.5000    3.2000
% 
% 
% rsq =
% 
%     1.0000