% Import Data into array 
X=table2array(studn(:,[4,6,7,8]))


% Q2 - Calculate Loadings after normilizing
% ... Subtract by Mean
% ... Then divide by the range
Y=(X-repmat(mean(X),100,1))
range=max(Y)-min(Y)
Y=bsxfun(@rdivide,Y,range)

% SVD
[Z,Mu,C]=svd(Y);
Z=-Z(:,1);

loadings=-sqrt(Mu(1,1))*C(:,1)
loadings2=-sqrt(Mu(2,2))*C(:,2)

% Q3 - Calculate Data Scatter and Contribution in %
p=100*(Mu(1,1)^2+Mu(2,2)^2)/sum(sum(Y.*Y))

