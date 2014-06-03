X=table2array(iris(:,1:4))

%SVD
[Z,Mu,C]=svd(X)
Z=Z(:,1:4)
Mu=Mu(1:4,:)

lamda=sqrt(Mu(1,1))
% 5.5386

%pca_score=sqrt(Mu(1,1))*Z(1,:)
loadings=-sqrt(Mu(1,1))*C(:,1)
%     4.1458
%     2.1055
%     2.8513
%     0.9620


% Estimate the contribution of the principal component to the data scatter,
% per cent. No normalization of original features is required.
ds=sum(sum(X.*X)); %Data Scatter
contrib=100*Mu(1,1)^2/ds

% Correct!
%Answer: 4.1458 2.1055 2.8513 0.9619 96.4547


% contribution percentage got right
% contrib:   96.4547 %

%------------------------------------
% Conventional Way
% Centrered Vec
%N=15 % V=5 ---- 15 x 5 matrix
%Y=X-repmat(mean(X),N,1)
% Covariance Matrix
%B = Y'*Y/N
%eigenvector/value
%[C,La]=eig(B)
%lamda1=La(4,4)
%c1=C(:,4)
%??lamda1=La(3,3) %4,4
%??c1=C(:,3) %4
%PCA Scoring
%z = Y*c1 / sqrt(N*lamda1)

