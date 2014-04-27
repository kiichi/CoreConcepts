%Count types of iris (last column)
%1. Import iris data as dataset_317_1.txt as "vector col"
%2. Name the target column as "namecol"

%http://www.mathworks.com/help/matlab/ref/countcats.html
%access the name element
result=countcats(categorical(namecol))
%     47
%     44
%     59

%from col vector to row vector - transpose
result'
%     47    44    59
    
summary(categorical(namecol))
%      I.setosa          47 
%      I.versicolor      44 
%      I.virginica       59 


%I.setosa, I.versicolor, I.virginica.
