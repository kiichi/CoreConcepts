%---------------------------------------
%http://youtu.be/tRIBYADPi-g
x=1:8
y=[0,1,2,3,5,8,10,12]
plot(x,y)

%3rd arg is the format!

%"magenta dotteted line square markers
plot(x,y,'m:s')

%green dash star
plot(x,y,'g--*')

%red solid no marker
plot(x,y,'r-')


%multiplot

%line 1
plot(x,y,'r:o')
%add one more line! use hold on syntax
hold on
y2=[4,4,5,5,8,9,12,16]
%line 2
plot(x,y2,'b-s')

hold on
y3=[4,3,3,1,1,3,2,5]
bar(x,y3,'green')

%--------------------------------
%http://youtu.be/FrdDpW52b5Q
% annotation 

xlabel('time [s]')
ylabel('altitude')
title('rocket')
legend('y[t]')












