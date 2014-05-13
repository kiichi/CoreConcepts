%filter only one taxon
rows=find(strncmp(iris.Iversicolor,'I.setosa',length('I.setosa')))
setosa=iris(rows,:)

% extract cols and convert to vector Petal Length and Width
x=setosa{:,1}
y=setosa{:,2}

%lm
p=polyfit(x,y,1)
fi=polyval(p,x)

plot(x,y,'ro')
hold on
plot(x,fi)

%see fit_iris.png