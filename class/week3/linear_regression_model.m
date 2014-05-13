y=[20,32,28,44,76,65,97,121,140,160]
x=1:length(y)
%it seems you need to install "Satistics Toolbox" wait wait
%mdl = fitlm(x,y)
%corr function too...


%instead, let's use polyfit and polyval functions
p=polyfit(x,y,1);

%p shows 15.9333   -9.3333
%This means,
%y = ax + b
%a is 15.9333 and b is -9.3333
%y = 15.9333 * x + -9.3333

fi=polyval(p,x)
%8.8222   23.9222   39.0222   54.1222   69.2222   84.3222   99.4222  114.5222  129.6222


plot(x,y,'ro')
hold on
plot(x,fi)


%see fit.png

%references
%http://www.mathworks.com/help/stats/linearmodel.fit.html
%http://www.mathworks.com/help/stats/fitlm.html
