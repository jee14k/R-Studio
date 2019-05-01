library(dplyr)
# dim
# tbl_df = creates a local data frame which wraps the dataset & prints neatly
aq = tbl_df(airquality)
aq
# given a condition, use filter(data,cond)
filter(aq,airquality$Temp>70)
filter(airquality,airquality$Temp>70)
filter(aq,airquality$Month==5 & airquality$Temp<70)
filter(aq,airquality$Day<6,airquality$Wind>8)
head(select(aq,Ozone,Solar.R,Wind,Temp))
head(select(aq,Ozone:Temp))
select(aq,-Ozone)
aq %>% select(Wind,Solar.R,Temp,Month) %>% filter(Month<=6)   # %>% = pipeline
emyattach(mtcars)
head(mtcars)
aq = tbl_df(airquality)
?mtcars
mtcars %>% select(hp,wt,drat,mpg,cyl,am) %>% filter(cyl == 6 & am == 0)
select(tbl_df(mtcars),starts_with("c"),ends_with("p"))
mutate(aq, TempC = (Temp-32)*5/9)
attach(airquality)
summarise(airquality,mean(Temp),na.rm = TRUE)
summarise(group_by(airquality,Month),
          mean(Temp,na.rm = TRUE))
airquality %>% 
  filter(Day>=20 & Day <=30) %>%
  group_by(Month)%>%
  summarise(mean(Wind,na.rm=TRUE))
