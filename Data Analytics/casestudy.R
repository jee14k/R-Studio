---
title: "Case Study Report for Analysis on Telecom Industry data"
author: "Parth Takkar, Anushka Gupta, Jeevan"
date: "24 January 2019"
output: word_document
---

\section{OBJECTIVES}
-To obtain and import a dataset in RStudio.
-To find the descriptive statistics for various fields in the data obtained regarding the telecom industry.
including the total number of calls during different times of the day, the charges and the total number of minutes spent on call.
-To find if the charges and the minutes spent on the call have any correlation.
-To check whether there is any significant difference in the evening call total charges and the night call total charges.
-To check whether high cost leads to higher requirement of customer service.
-To visualize the data using various graphs.

\section{PROCEDURE}
Importing the dataset regarding the telecom industry in RStudio.

```{r}
datafile<-read_excel("C:/Users/Parthi/Desktop/bigml_59c28831336c6604c800002a.xlsx")
datafile
```
---
title: "Case Study Report for Analysis on Telecom Industry data"
author: "Parth Takkar, Anushka Gupta, Jeevan"
date: "24 January 2019"
output: word_document
---

\section{OBJECTIVES}
-To obtain and import a dataset in RStudio.
-To find the descriptive statistics for various fields in the data obtained regarding the telecom industry.
including the total number of calls during different times of the day, the charges and the total number of minutes spent on call.
-To find if the charges and the minutes spent on the call have any correlation.
-To check whether there is any significant difference in the evening call total charges and the night call total charges.
-To check whether high cost leads to higher requirement of customer service.
-To visualize the data using various graphs.

\section{PROCEDURE}
Importing the dataset regarding the telecom industry in RStudio.

```{r}
datafile<-read_excel("C:/Users/Parthi/Desktop/bigml_59c28831336c6604c800002a.xlsx")
datafile
```
Finding the descriptive statistics for the call minutes during various times of the day.
```{r}

print("day minutes")
summary(datafile$`total day minutes`)
print("eve minutes")
summary(datafile$`total eve minutes`)
print("night minutes")
summary(datafile$`total night minutes`)

```

## R Markdown

Extracting a small sample from the dataset.
```{r}
print("Sample of size 25")
sample1<-sample(1:nrow(datafile),25)
df1<-data.frame(datafile[sample1,])
df1
```

Correlation between minutes and charges
```{r}
print("Correlation of minutes and charges")
cor.test(datafile$`total night minutes`,datafile$`total night charge`,method="pearson")
print("Variance of evening and night charges")


``` 
Checking the variances and performing t-test for comparison of means of the total evening and night charges.
```{r}
var(datafile$`total eve charge`)
var(datafile$`total night charge`)
print("T test")
t.test(df1$total.eve.charge,df1$total.night.charge,var.equal = FALSE)
```

Checking whether high cost leads to higher requirement of customer service.

```{r}
chisq.test(df1$total.day.charge,df1$customer.service.calls)
```
Visualization using Graphs
```{r}
mean.totaldaycalls = mean(datafile$total.day.calls,na.rm = TRUE)#getting the mean of total day calls
mean.totaldaycalls 
plot(datafile$total.day.calls,datafile$total.eve.calls,main = "Total Day Calls vs Total Evening Calls",xlab = "Total Day calls",ylab = "Total Evening Calls",pch=20,data = datafile)   #plotting total day calls with total evening calls
abline(h=mean.totaldaycalls)  #adding the mean to the graph
model1=lm(total.day.calls~total.eve.calls,data=datafile)   #getting a linear model
abline(model1,col="red")   #Fitting the linear model to the graph
plot(model1)  
plot(datafile$total.eve.calls,datafile$total.night.calls,main = "Total Evening Calls vs Total Night",xlab = "Total Evening calls",ylab = "Total Night",pch=20,col='red')
d=density(datafile$total.day.calls)  #Kernel density plot
d
plot(d,main="Total Day Calls")
polygon(d,col="red",border="black")   
boxplot(datafile$total.intl.charge,main = "Total International Charge",col="blue",border="brown",horizontal = TRUE,notch = TRUE)
datafile$churn = factor(datafile$churn,   #converting textual values to numerical values
                    levels = c('TRUE','FALSE'),
                    labels = c(1,0))
datafile$voice.mail.plan = factor(datafile$voice.mail.plan,
                              levels = c('yes','no'),
                              labels = c(1,0))
datafile$international.plan = factor(datafile$international.plan,
                                 levels = c('yes','no'),
                                 labels = c(1,0))
datafile$total.day.calls = ifelse(is.na(datafile$total.day.calls),
                        ave(datafile$total.day.calls,FUN = function(x) mean(x,na.rm = TRUE)),
                        datafile$total.day.calls)
datafile$total.day.minutes = ifelse(is.na(datafile$total.day.minutes),
                        ave(datafile$total.day.minutes,FUN = function(x) mean(x,na.rm = TRUE)),
                        datafile$total.day.minutes)
```

\section{INTERPRETATION}
DESCRIPTIVE STATISTICS
From the descriptive statistics thus obtained for the total minutes for calls during the day, evening and night, we see that the mean of total evening minutes is the maximum. Also, the value of mean of total night minutes is very close to the value of the highest total minutes. Hence, we compare if there is a significant difference in the means of total evening and night minutes.

In order to compare the means, we use the total evening and night charges since the call minutes and charges are directly proportional to the charges. This can be verified by evaluating the correlation between the two.

CORRELATION
We see that the Karl Pearson's coefficient of correlation has a value of 0.9999 which is positive hence directly proportional and is approximately equal to 1. Thus, we extract a sample from the dataset and apply a test of significance in order to understand if there is a significant difference in the means of total evening and night charges.

T-TEST
Since the sample taken is a small sample, we apply the t-test.
We see that the variances of the two columns considered are very different, hence we need to use t-test for unequal variances.

H0: There is no significant difference between the means of total evening and night charges.
H1: There is a significant difference between the means of total evening and night charges.

From the results so obtained, we see that the p-value=1.078e-09 which is less than the level of significance i.e. 0.05 due to which we reject the null hypothesis. Hence, we accept the alternative hypothesis that there is a significant difference between the means of the charges. 

CHI-SQUARE TESTS
H0: The means of the day charges and the customer service calls are independent of each other.
H1: The means of the day charges and the customer service calls are not independent of each other.
From the result obtained, we see that the p-value=0.3697 which is greater than the level of significance hence we accept the null hypothesis that they are independent. Therefore, the assumption that higher costs will lead to more complaints consequently more customer service calls is wrong.

VISUALISATION USING GRAPHS

We are finding the mean of total day calls to replace all the values that are not applicable.
We are then plotting the graph between Total Day calls & Total evening to see whether they are related.
Using the concept of linear regression, we are fitting a linear model to the graph of total day calls. 
A kernel density plot is shown of the total day calls which tells us that the graph is normally distributed. 
To replace the textual data - to make TRUE = 1 & FALSE = 0, we are using the factors function and labelling it with 1 & 0. This is the case for the churn column, voice mail plan and international plan. 
The total day calls and total day minutes might have nil values and we are replacing that with the mean of the corresponding column. 