sample(1:6,10,replace = TRUE)
set.seed(1)
set.seed(2)
set.seed(123)
index<-sample(1:nrow(iris),5)
index
iris[index,]
mean(iris$Sepal.Length)