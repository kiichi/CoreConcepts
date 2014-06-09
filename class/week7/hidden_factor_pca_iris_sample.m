iris2=table2array(sampleiris(:,1:4))

% Normalize all Iris data by max=100
mi=min(iris2)
iris_min=iris2-repmat(mi,15,1)
ma=max(iris_min)
X=iris_min*100./repmat(ma,15,1)

%X=iris2

% Find First Singular Triplet
[Z,Mu,C]=svd(X);
C1=-C(:,1)

% Factor Alpha - rescaler for max 100
alpha = 1/sum(C1)

% Compute the PCA hidden factor score vector
% e.g. Row Num 3, 15, 150
z1=sum(X(5,:).*C1'*alpha)
z2=sum(X(10,:).*C1'*alpha)
z3=sum(X(15,:).*C1'*alpha)

% Contribution?
%Mu=Mu(1,1);
%ds=sum(sum(X.*X));  %Data Scatter
%contrib=100*Mu^2/ds % Contribution in Percentage


%3.7059 43.8576 86.9379
