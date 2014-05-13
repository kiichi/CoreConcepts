%http://www.mathworks.com/help/matlab/data_analysis/linear-regression.html
y=[20,32,28,44,76,65,97,121,140]
x=1:length(y)

[x,y,mu] = polyfit(x,y,1)

%-----------------------------------
% p =
% 
%    41.3531   69.2222
% 
% 
% S = 
% 
%         R: [2x2 double]
%        df: 7
%     normr: 31.4477
% 
% 
% mu =
% 
%     5.0000
%     2.7386
%-----------------------------------