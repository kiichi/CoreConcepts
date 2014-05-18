%Import iris.mat - random generated iris
% -----------------------------------------------
% Generate Nominal Feture "f" via Sepal Length

% hist_sepal_length.png
hist(iris.SL,30)

% see boundly.png
boundly=[4 5.3 5.9 7 8]

% Put each Sepal Length Value into one of buckets:
% Group 1 - Group 4 
for k=1:4;
    f=find(iris.SL>=boundly(k) & iris.SL<boundly(k+1));
    g(f)=k;
end;


% -----------------------------------------------
% Optional: Generate Nominal Feture "h" via Sepal Width 
hist(iris.SW,30)

% see boundly2.png
boundly2=[2 2.5 2.9 3.5 4.3]
% Put each Sepal Length Value into one of buckets:
% Group 1 - Group 4 
for k=1:4;
    f=find(iris.SW>=boundly2(k) & iris.SW<boundly2(k+1));
    h(f)=k;
end;

% -----------------------------------------------
% 
% % T1 Count: 50
% t1c=length(find(strncmp(iris.Taxon,'I.setosa',length('I.setosa'))))
% 
% % T2 Count: 49
% t2c=length(find(strncmp(iris.Taxon,'I.versicolor',length('I.versicolor'))))
% 
% % T3 Count: 51
% t3c=length(find(strncmp(iris.Taxon,'I.virginica',length('I.virginica'))))
% 

% create index 1-50 is 1, 50-100 is 2, and 100-150 is 3
for k=1:3; 
    f1=(k-1)*50+1; 
    f2=(k*50); 
    t([f1:f2])=k; 
end;



% Taxon T1 - T3
tx = ['I.setosa' 'I.versicolor' 'I.virginica']

% G1, G2, G3 and G4
for m=1:4;    
    found_idx = find(iris.SL>=boundly(m) & iris.SL<boundly(m+1));
    disp(found_idx)
    % T1, T2, and T3
    %for n=1:4;        
    %    nl(m,n) = length(find(iris.SL>=boundly(m) & iris.SL<boundly(m+1)));    
    %end;
end;


