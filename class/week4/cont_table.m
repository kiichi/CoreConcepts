%Import iris.mat - random generated iris

% Build contengency table

% hist_sepal_length.png
hist(iris.SL,30);

% see boundly.png
boundly=[4 5.3 5.9 7 8];
% t1c=length(find(strncmp(iris.Taxon,'I.setosa',length('I.setosa'))))

% Taxon T1 - T3
%tx = ['I.setosa' 'I.versicolor' 'I.virginica']
tx={'I.setosa','I.versicolor','I.virginica'};

% G1, G2, G3 and G4
for m=1:4;    
    found_idx = find(iris.SL>=boundly(m) & iris.SL<boundly(m+1));
%   disp(iris.Taxon(found_idx));
    % T1, T2, and T3
    for n=1:3;                
        % The strcmp below returns 1 or 0
        % so the sum of matching taxon is the count of the cell.
        cnt=sum(strncmp(iris.Taxon(found_idx),tx{n},length(tx{n})));
        nl(n,m)=cnt;        
    end;
end;
disp(nl);

% Finally, you got that table.
% see table.png for another exaple when each taxon count is 50

%     39    11     0     0
%      3    17    28     1
%      0     3    38    10






