
%---------------------------------------------------
% Spectrum - Eigenvector (c) and Eigenvalue (lamda)
% Spectral Decomposition 
a=[1 1 2;1 3 3;2 3 1]
f=[1;-1;1]

% Diffrent Direction
% Mult
a*f

% Div - different
a*f./f
%     0.3792
%     0.7171
%     0.5848

% Same Direction
c=[0.3792;0.7171;0.5848]

% Mult
a*c
%     2.2659
%     4.2849
%     3.4945


% Div - same 5.9755
a*c./c
%     5.9755
%     5.9753
%     5.9755

%--------------------------------------------
% a * c = lamda * c
%--------------------------------------------


a=[1;2;-4]
A=a*a'

% a is eigenvector (c)

% Eigenvalue (lamda)
l=A*a
%     21
%     42
%    -84

lamda=l(1,1) 
% This is 21 = |a|^2=<a,a>=a'*a
lamda*a
%     21
%     42
%    -84

   
a'*a


