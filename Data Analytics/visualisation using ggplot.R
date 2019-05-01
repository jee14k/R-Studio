#Seeing the datasets in R
library(MASS)
data()
WWWusage
iris
#loading ggplot package
library(ggplot2)
head(iris,5)
u <- ggplot(iris,aes(x=Sepal.Length,y=Petal.Length))
u <- ggplot(iris,aes(x=Sepal.Length,y=Sepal.Width))
u <- ggplot(iris,mapping=aes(x=Sepal.Length,y=Sepal.Width,color=Species)) + geom_line()
u
#using geom_point()
u + geom_point()
a <- u + geom_point(aes(color = Species))

#mapping
a + geom_point(color="blue")
#setting
a + aes(color = Species,alpha = 5.0)

#using geom_boxplot()
d <- ggplot(iris,aes(x=Species,y=Petal.Length))
d + geom_boxplot()
d + geom_jitter(alpha=0.3,color= "tomato") +geom_boxplot()
boxy <- d + geom_jitter(alpha=0.3,color= "tomato") +geom_boxplot(alpha=0)

#faceting
u <- ggplot(iris,mapping=aes(x=Sepal.Length,y=Sepal.Width,color=Species)) + geom_line(size=1.5)
u + facet_wrap(~ Species) 
#+ theme_bw() + theme(panel.grid = element_blank())

#customization
g<- u + facet_wrap(~ Species) +  labs(title = "Sepal Graph",
                                  x = "Length",
                                  y = "width")
#combining the graphs
ggarrange(boxy,g,widths=c(4,6))
install.packages("ggpubr")
library(ggpubr)
?ggarrange()