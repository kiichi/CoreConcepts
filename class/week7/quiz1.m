% Q1 - Simple Loading from svd - no normalization.
data=table2array(studn(:,[4,6,7,8]))
[Z,Mu,C]=svd(data);
loadings=-sqrt(Mu(1,1))*C(:,1)

