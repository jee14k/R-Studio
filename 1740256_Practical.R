library(ggplot2)        #importing the ggplot package
library(dplyr)      # importing the dplyr package
setwd("C:/Users/mcalab_40/Desktop/Jeevan ESE")     # setting the working directory
Frogs<-read.csv("Frogs.csv")    # importing the csv file
View(Frogs)
spot<-filter(Frogs,Frogs$Status=="1")    #all the frogs which were spotted
# View(spot)
count(spot)    # counting the number of frogs which were spotted
summary(Frogs$northing)   # Finding the range for spotting the frogs
summary(Frogs$easting)
north<-filter(Frogs,Frogs$Status=="1" & Frogs$northing>100 & Frogs$easting<1050)
# View(north)
count(north) 
# counting number of frogs spotted where reference point for northing > 100 & easting <1050
no_spot<-filter(Frogs,Frogs$Status=="0")
avg_no_spot<-mean(no_spot$altitude)
avg_no_spot
barplot(spot$avrain,spot$Status,  #visualising average rainfall for spring period where frogs are spotted
        col="maroon",
        xlab = "Average Rainfall",ylab = "Frogs spotted",
        main = "Average rainfall where frogs are spotted")
avg_spot_rain<-mean(spot$avrain)
avg_spot_rain
avg_no_spot_rain<-mean(no_spot$avrain)
avg_no_spot_rain
spot_fifty_three<-filter(spot,spot$NoOfPools>50 & spot$NoOfSites==3)
# View(spot_fifty_three)
count(spot_fifty_three) 
# counting the number of frogs which are spotted in more than 50 pools with 3 sites for potential breeding
cor(x = Frogs$avrain,y = Frogs$meanmax)
cor.test(x = Frogs$avrain,y=Frogs$meanmax)
# Finding a relation between average rainfall & maximum spring temperature
spot_alt<-mean(spot$altitude)
spot_alt   # Finding the average altitude to spot frogs
spot_dist<-mean(spot$distance)
spot_dist # Finding average distance to spot frogs