% Import Data into array - e.g. sample iris
data=table2array(sampleiris(:,1:4))

% SVD
[Z,M,C]=svd(data);
c1=-C(:,1);
Z=-Z(:,1);

% Rescaling 
Y=bsxfun(@minus,Z,min(Z));
Y=bsxfun(@times,Y,c1');

range=max(Y)-min(Y);
R=bsxfun(@rdivide,Y,range);
Z=bsxfun(@times,R,100);

% Extract scores for  row num 5,10,15
z1=Z(5,1)
z2=Z(10,1)
z3=Z(15,1)