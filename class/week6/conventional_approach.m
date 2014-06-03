%===========================================
% Hidden Factor Model v.s. Conventional Approach (Part 2)
%===========================================
X=[ 41 66 90; 
    57 56 60; 
    61 72 79; 
    69 73 72; 
    63 52 88; 
    62 83 80]

%--------------------------------------
% Step 1: Centered Vector, Y
N=6 % X is N x V matrix = 6 x 3
Y=X-repmat(mean(X),N,1)

%--------------------------------------
% Step 2: B - covariance matrix
B = Y'*Y/N

%--------------------------------------
% Step 3: Eigenvector and Eigenvalue
[C,La]=eig(B)
lamda1=La(3,3)
c1=C(:,3)

% lamda1 =
%   124.8447
% c1 =
%    -0.5933
%    -0.3734
%    0.7131

%--------------------------------------
% Step 4: Principal Component Scoring Vector
z = Y*c1 / sqrt(N*lamda1)
%     0.7086
%    -0.2836
%    -0.0935
%    -0.4629
%     0.3705
%    -0.2391

% Now, compare this result with model based approach. it's same
% See compare.png

% sqrt(N*lamda1)
%27.37 = sqrt(6*124.8447)



% Summary: See model_vs_conventional.png














