x=2:10
y=[2727,1200,1107,1101,1070,1030,1026,1025,1011]
plot(x,y)
%See novel.png it's power distribution


%Generate values from a normal distribution with mean 80 and standard
%deviation 40
v=40+80.*randn(30,1)

%Class of 30 students merged with class of 20 students. 
%The average mark at a test in the first class is 80, and in the second class, 60. 
%What is the average mark in the merged class?
(30*80+20*60)/(30+20)

%median of following equation is 3. 
%x is 1.
(2*x-3 + 3*x+2 + x-1 + 4*x+2+ 2*x+3)/5

x=1
v=[2*x-3, 3*x+2, x-1, 4*x+2, 2*x+3]
%  -1     5     0     6     5
median(sort(v))
%5
