X=[6 7;5 8;8 9]
c=[1;3]
z=X*c
X'

% Both below are same result
%    587
%    736
c_hat=X'*z
c_hat=X'*X*c

% Is c is same line on c_hat?
c_hat./c
%   587.0000
%   245.3333

% NO - the second one (y) is different
% So what is the c here to make c_hat and c to be on the same line?


% This is symmetric below
A=X'*X

c_hat=X'*X*c


% Need two orthogonal eigenvectors to make this true
% A*c=lamda*c

% Matlab Function eig(A)
[C,La]=eig(A)

% Eigen Vetor - columns
% C =
%    -0.7806    0.6251
%     0.6251    0.7806
% 

c=C(:,2)

% Eigen Value - positive one
% La =
%     1.6829         0
%          0  317.3171

lamda=La(2,2)

z=X*c
c_hat=X'*z

% So that c and A*c sit on the same line
% A*c = lamda*c

A*c
lamda*c

% Both (left and right) are same!
%   198.3413
%   247.6911


%---------------------------------
% Triplet (u,c,z) of X
% X*c=u*z
% X'*z=u*c

% Correspoinding
% A=X'*X where c is the eigen vector
% and lamda = u^2
% and z=X*c/u


















