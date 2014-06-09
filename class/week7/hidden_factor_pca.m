X=table2array(iris(:,1:4))

% -------------
% SVD 
% -------------

[Z,Mu,C]=svd(X)     % Calculate SVD

%Z=Z(:,1:4)         % Scoring Vector
Z=Z(:,1)            % First Scoring Vector
Z=-Z                % If Minus, flip the sign

%Mu=Mu(1:4,:)       % Singular Values
Mu=Mu(1,1)          % Max Singular Value

C=C(:,1)
C=-C
% TO transpose, use C'


lamda=sqrt(Mu)
%loadings=-sqrt(Mu)*C(:,1)
ds=sum(sum(X.*X));  %Data Scatter
contrib=100*Mu^2/ds % Contribution in Percentage

% -------------
% Rescaling
% -------------
% Multiply 100 for each element and add them up
% Then divided by 100 again, that's the multiplier
% Because we are trying to adjust to 100
a=100/(sum(C')*100)

% Adjusted C' now
C'*a

% Compare row number 1 PCA v.s. Mean
sum(X(1,:).*C'*a)   % 3.4143
mean(X(1,:))        % 2.6750


% Compare row number 2 PCA v.s. Mean
sum(X(2,:).*C'*a)   % 4.7706
mean(X(2,:))        % 3.8500



% Etc...




















