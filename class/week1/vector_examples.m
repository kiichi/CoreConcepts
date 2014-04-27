%--------------------------------------
%http://youtu.be/GUoIkyh4XaM

%row vector
vRow = [3,-3,2,10,1.4]

%col vector - use semi colon - yacky again
vCol = [3;-2;9.3;2]

%--------------------------------------
%http://youtu.be/CZf-9CXgZfU

%sequence - equal interval
%yacky syntax again!
%"From 2 to 3, repeat element every 0.2 interval"
%2.0,2.2,2.4,....3.0
vEq = 2:0.2:3 
% 2.0000    2.2000    2.4000    2.6000    2.8000    3.0000

vEq = 10:5:100
% 10    15    20    25    30   ....


% You can ommit the middle parameter
% if the interval is 1
vEq = 2:1:7
%2     3     4     5     6     7

% is equivalent to 
vEq = 2:7
%--------------------------------------
%http://youtu.be/l41Pvbwk1XQ

v=[5;2;-1;0;4]

%Access 4th element
a=v(4)
%returns 0

%set 4th element
v(4) = 7
a=v(4)

%returns 7

%add more elements
v(6)=100
v(7)=200
v(8)=300

v

n=7
dv = v(n)-v(n-1)

%--------------------------------------
%http://youtu.be/1ZbFr9YJMFg

x=1
x0=2
z=1+2*(x-x0)+(x-x0)^2
v=[1;1.5;2;2.5;3]
%{
    1.0000
    1.5000
    2.0000
    2.5000
    3.0000
%}
a=3
b=a*v

%{
    3.0000
    4.5000
    6.0000
    7.5000
    9.0000
%}

% expand the size to match
c = v + a * ones(size(v))

d=v+a

%this will be error
%because trying to take the power 
% of the entire vector
%e=v^2

%in order to specify the individual element
% use dot " . " operator

% "take power for each item in the vector"
e=v.^2
%{
    1.0000
    2.2500
    4.0000
    6.2500
    9.0000
%}

%subtract from one vector to another
delta =v-x0

%{
   -1.0000
   -0.5000
         0
    0.5000
    1.0000
%}

%e.g.
z=1+2*delta+delta.^2







