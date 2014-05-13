y=[20,32,28,44,76,65,97,121,140]
x=1:length(y)
%it seems you need to install "Satistics Toolbox" wait wait
%mdl = fitlm(x,y)
%corr function too...


%instead, let's use polyfit and polyval functions
p=polyfit(x,y,1);

fi=polyval(p,x)
%8.8222   23.9222   39.0222   54.1222   69.2222   84.3222   99.4222  114.5222  129.6222


plot(x,y,'ro')
hold on
plot(x,fi)


%see fit.png

%references
%http://www.mathworks.com/help/stats/linearmodel.fit.html
%http://www.mathworks.com/help/stats/fitlm.html
