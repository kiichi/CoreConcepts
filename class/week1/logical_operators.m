%--------------------------------------
%http://youtu.be/Sv_6CpAEea8

a=10
r=a>3
%1 is true / 0 is false

% and operator
r= a>3 & a<10

% or
r= a>3 | a<10

%not
r=~(a>3)


%-------------------------
%http://youtu.be/HXnOE0xFMbA

%filtering out vector
v=[1;10;7;3;8;29]
%extract logical operator results as
%true / false 
i=v<5

%{
     1 true
     0
     0
     1 true
     0
     0
%}

% give me all elements with true
r=v(i)

%     1
%     3

















