% Q1 - Simple Loading from svd - no normalization.
data=table2array(studn(:,[4,6,7,8]))
[Z,Mu,C]=svd(data);
loadings=-sqrt(Mu(1,1))*C(:,1)
%loadings2=-sqrt(Mu(2,2))*C(:,2)

ds=sum(sum(X.*X)); %Data Scatter
contrib=100*Mu(1,1)^2/ds