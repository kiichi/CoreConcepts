library(datasets)
#print(colnames(iris))

#all 
sepal_l<-iris[,'Sepal.Length']

#Species: setosa,versicolor,virginica
#sepal_l<-iris[iris[,'Species'] == 'setosa','Sepal.Length']
#sepal_l<-iris[iris[,'Species'] == 'versicolor','Sepal.Length']
#sepal_l<-iris[iris[,'Species'] == 'virginica','Sepal.Length']

#hist(sepal_l)
len<-length(sepal_l)

times<-10000
result<-numeric(times)
for (i in 1:times){
  result[i]<-mean(sample(sepal_l, len, replace=T))
}
hist(result)
print(summary(result))
# Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
# 5.543   5.798   5.843   5.844   5.889   6.095 

#what is the percentile within the 95%? = somewhere in the middle of from 2.5% to 97.5%
qt_pts<-quantile(result, c(0.025,0.975))
print(qt_pts)

# 2.5%    97.5% 
# 5.715333 5.974000 


