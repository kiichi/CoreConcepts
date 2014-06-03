%===========================================
% Hidden Factor Model v.s. Conventional Approach (Part 1)
%===========================================
% See hidden_model.png
X=[ 41 66 90; 
    57 56 60; 
    61 72 79; 
    69 73 72; 
    63 52 88; 
    62 83 80]

%x=z*c+e % z is hidden factor (score)
[Z,Mu,C]=svd(X)

% Z =
%    -0.4015   -0.7139   -0.4033    0.1747   -0.3362   -0.1519
%    -0.3414    0.3114    0.2075   -0.4350   -0.7437    0.0338
%    -0.4222    0.0859   -0.0948   -0.4818    0.4577   -0.6031
%    -0.4219    0.4583    0.0582    0.7332   -0.0390   -0.2637
%    -0.4071   -0.3594    0.7596    0.0379    0.2381    0.2648
%    -0.4476    0.2166   -0.4528   -0.0961    0.2572    0.6873
% Mu =
%   291.3911         0         0
%          0   27.3669         0
%          0         0   20.8390
%          0         0         0
%          0         0         0
%          0         0         0
% C =
%    -0.4948    0.5895    0.6385
%    -0.5667    0.3382   -0.7513
%    -0.6588   -0.7336    0.1667


% Three singular 6D scoring vectors
Z=Z(:,1:3)
%    -0.4015   -0.7139   -0.4033
%    -0.3414    0.3114    0.2075
%    -0.4222    0.0859   -0.0948
%    -0.4219    0.4583    0.0582
%    -0.4071   -0.3594    0.7596
%    -0.4476    0.2166   -0.4528
    
% Three singular values on diagnol
Mu=Mu(1:3,:)
%   291.3911         0         0
%          0   27.3669         0
%          0         0   20.8390

lamda=sqrt(Mu(1,1))

%PCA Score Vector
Zi=sqrt(Mu(1,1))*Z(1,:)

%Loading
Cv=sqrt(Mu(1,1))*C(:,1)

% Data Scatter
ds=sum(sum(X.*X))
% 86092
100*Mu(1,1)^2/ds
% This is the contribution of first component
%  98.6256 percent


% Try centering now
Y=X-repmat(mean(X),6,1)
% svd again - now PC has been changed, lower contribution
[Z,Mu,C]=svd(Y)
Z=Z(:,1:3)
Mu=Mu(1:3,:)
ds=sum(sum(Y.*Y))
100*Mu(1,1)^2/ds

% Only 43.3071 percent!
% centering (=subtracting column) 
% This happened because PC must go throught the origin

% Summary : pca_summary.png


