%load('/Users/kiichi/work/matlab/CoreConcepts/class/week8/FuzzyClusteringToolbox_m/FUZZCLUST/Kmeans.m')

X=table2array(iris(:,1:4))
% subtracting the feature means and dividing by feature ranges
Y=(X-repmat(mean(X),150,1))
range=max(Y)-min(Y)
Y=bsxfun(@rdivide,Y,range)

% Take 1st, 6th and 11th objects were chosen as initial centers
c=[Y(1,:);Y(51,:);Y(101,:)]


cd /Users/kiichi/work/matlab/CoreConcepts/class/week8/
kmeans(Y,3,c)
