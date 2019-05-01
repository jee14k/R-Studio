airquality
names(airquality)
plot(Ozone~Solar.R,data=airquality)    #variable before ~ is dependent
mean(airquality$Ozone)
mean.ozone<-mean(airquality$Ozone,na.rm = TRUE)   #na.rm=removing all values with NA
mean.ozone
abline(h=mean.ozone)    #Fitting mean to the graph
model1<-lm(Ozone~Solar.R,data=airquality)   #Fitting a linear regression model 
abline(model1,col="red")   #Fitting the linear model to the graph
plot(model1)

summary(model1)

mtcars
names(mtcars)
plot(qsec~hp,data=mtcars)
mean(mtcars$qsec)
mean.qsec<-mean(mtcars$qsec)
mean.qsec
abline(h=mean.qsec)
model2<-lm(qsec~hp,data = mtcars)
model2
abline(model2,col="green")
plot(model2)
summary(model2)