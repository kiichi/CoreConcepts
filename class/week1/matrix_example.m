%---------------------------------
%http://youtu.be/1FRWsXH3Z1Y

a=[ 1,2,3,4; 5,6,7,8; 9,10,11,12 ]
%{
     1     2     3     4
     5     6     7     8
     9    10    11    12
%}

%---------------------------------
%http://youtu.be/BwiKH7v5N6U

%array creation functions
r=rand(3)
%     0.7577    0.6555    0.0318
%     0.7431    0.1712    0.2769
%     0.3922    0.7060    0.0462

o=ones(3)

%      1     1     1
%      1     1     1
%      1     1     1

z=zeros(3,5)
%      0     0     0     0     0
%      0     0     0     0     0
%      0     0     0     0     0

%identity
i=eye(3)

%      1     0     0
%      0     1     0
%      0     0     1

%random int bet. 0 and 2
r=randi([0,2],3,3)

%      0     2     0
%      1     2     0
%      2     1     0

r=randn(1,3)
% 1.3546   -1.0722    0.9610

d=diag([-1,2,3])
%     -1     0     0
%      0     2     0
%      0     0     3

%--------------------------------
%http://youtu.be/b2CVW32OkkQ
l=length(r)
%3
l=length(d)
%3
s=size(d)
%     3     3

%--------------------------------
%http://youtu.be/MKK-QzfYOsI
% Access elements in array
% Subsetting

%seed to give same random number
rng(1) 
m=randi([1,10],3,3)
%      5     4     2
%      8     2     4
%      1     1     4

m(3,2)
% 1

%subset - 2nd row & get element 1 - 3
m(2,[1,2,3])
%     8     2     4

% same thing, use sequence
m(2,1:3)
%     8     2     4

%even shorter
m(2,:)
%     8     2     4


%----------------------------------
%http://youtu.be/CFW_Qjjzl10
%statistics function
rng(1) 
m=randi([1,10],3,3)
%      5     4     2
%      8     2     4
%      1     1     4

%calculate mean of each column
mean(m)
%4.6667    2.3333    3.3333

% calculate mean of each row
% specify the dimension
mean(m,2)
%mean of row now
%     3.6667
%     4.6667
%     2.0000


%Flatterning
v=reshape(m,9,1)

%      5
%      8
%      ...
%      4

mean(v)
%3.44

%this is equivalent to ....
v=m(:);
mean(v)

%mean,std,median,mode,min,max,sum,prod, etc

%----------------------------------
%http://youtu.be/a2SWt_AKL8s
%eigenvalues and eigenvectors


rng(1) 
m=randi([1,10],3,3)
%      5     4     2
%      8     2     4
%      1     1     4
[v,d]=eig(m)


% v =
% 
%    -0.6439   -0.4586   -0.4626
%    -0.7326    0.8862   -0.2215
%    -0.2207   -0.0664    0.8585
% 
% 
% diagnal matrix d
% d =
% 
%    10.2365         0         0
%          0   -2.4398         0
%          0         0    3.2032




