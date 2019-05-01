library(readr)
library(dplyr)
library(ggplot2)
BEPS <- read_csv("C:/Users/Jeevan/Desktop/Christ University/R Studio/BEPS.csv")
View(BEPS)
summary(BEPS)
chisq.test(BEPS$age,BEPS$vote)   #1
chisq.test(BEPS$gender,BEPS$vote)      #1
# ggplot(BEPS,aes(x=BEPS$age,y=BEPS$vote) +
#          geom_point(col = "yellow", size = 1, shape = 18) +
#          xlim(c(0,3)) + ylim(c(0,20000)) +
#          labs(title = "Vote vs Age",
#               subtitle = "From dataset BEPS",
#               x = "Age",y = "Vote",
#               caption = "Plot shows how vote varies with age"))
srs<-sample_n(BEPS,250)   #2
srs_lab<-filter(srs,vote=="Labour")  #2   
View(srs_lab)
srs_lab_age<-mean(srs_lab$age)  #2
srs_lab_age
select(BEPS,economic.cond.national,gender)   #3
 # ggplot(BEPS,aes(x=BEPS$gender,y=BEPS$economic.cond.national)) +
 #  geom_point(col = "black", size = 1, shape = 18) +
 #  xlim(c(0,3)) +ylim(c(0,20000)) +
 #  labs(title = "National Economic condition vs gender",
 #       subtitle = "From dataset BEPS",
 #       x = "Gender", y = "National Economic condition",
 #       caption = "Plot shows how economic condition varies with gender")
g<-table(BEPS$gender)  #3
barplot(g,BEPS$economic.cond.national,
        main = "Economic condition of nation w.r.to Gender", 
        xlab = "Gender", ylab = "Economic condition of nation",
        col = "Black")
cons<-filter(BEPS,BEPS$vote=="Conservative")   #4
t.test(BEPS$Kennedy,       #4
       alternative = "greater",
       mu = 3)
male<-filter(BEPS,BEPS$gender=="male")      #5
female<-filter(BEPS,BEPS$gender=="female")    #5
smale<-sample_n(male,150)     #5
View(smale) 
sfemale<-sample_n(female,150)   #5
View(sfemale)
# How am I supposed to visualise it?
ldp<-filter(BEPS,vote=="Liberal Democrat")     #6
View(ldp)
ldp_age<-mean(ldp$age)    #6
ldp_age
eur_ldp<-filter(ldp,ldp$Europe>7 & ldp$Europe<=11)  #6
View(eur_ldp)
age_fifty<-filter(BEPS,BEPS$age>50)   #7
View(age_fifty)
age_fifty_blar<-filter(age_fifty,age_fifty$Blair>=4)   #7
View(age_fifty_blar)
negeur_age_fifty_blar<-filter(age_fifty_blar,age_fifty_blar$Europe<=4)  #7
count(negeur_age_fifty_blar)  #7