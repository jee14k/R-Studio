#Regression analysis
#linear regression model
#plotting
head(airquality,5)
names(airquality)
plot(Ozone~Solar.R,data=airquality)
#WHy??
mean(airquality$Ozone)
#Mean
mean(airquality$Ozone,na.rm = TRUE)
mean.ozone <- mean(airquality$Ozone,na.rm = TRUE)
#Fitting the mean to the graph
abline(h=mean.ozone)
#Fitting Regression Line to the graph
model1 <- lm(Ozone~Solar.R,data=airquality)
model1
abline(model1,col="red")
#plotiing 
plot(model1)
#Summary
summary(model1)

