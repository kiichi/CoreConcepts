X=table2array(iristest(:,1:4))
% subtracting the feature means and dividing by feature ranges
Y=(X-repmat(mean(X),15,1))
range=max(Y)-min(Y)
Y=bsxfun(@rdivide,Y,range)

% Take 1st, 6th and 11th objects were chosen as initial centers
Y(1,:)
Y(6,:)
Y(11,:)
