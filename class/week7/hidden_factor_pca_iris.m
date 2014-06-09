iris2=table2array(iris(:,1:4))

% Normalize all Iris data by max=100
ma=max(iris2)
X=iris2*100./repmat(ma,150,1)

% Find First Singular Triplet
[Z,Mu,C]=svd(X);
C1=-C(:,1)

% Factor Alpha - rescaler for max 100
alpha = 1/sum(C1)

% Compute the PCA hidden factor score vector
% e.g. Row Num 3, 15, 150
z1=sum(X(3,:).*C1'*alpha)
z2=sum(X(15,:).*C1'*alpha)
z3=sum(X(150,:).*C1'*alpha)

% Contribution?
Mu=Mu(1,1);
ds=sum(sum(X.*X));  %Data Scatter
contrib=100*Mu^2/ds % Contribution in Percentage