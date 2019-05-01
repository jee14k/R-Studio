library(ggplot2)
View(diamonds)
ggplot(diamonds,aes(x=carat,y=price)) + 
  geom_point(col = "maroon", size = 1, shape = 18) +
  xlim(c(0,3)) + ylim(c(0,20000)) +
  labs(title = "Carat vs Price",
       subtitle = "From dataset diamonds",
       x = "Carat", y = "Price in $",
       caption = "Plot shows how price varies with respect to carat")
ggplot(diamonds,aes(x=carat,y=price)) + 
  geom_point((aes(col = cut)), size = 1, shape = 18) +
  xlim(c(0,3)) + ylim(c(0,20000)) +
  geom_smooth(col = "Red") +
  labs(title = "Carat vs Price",
       subtitle = "From dataset diamonds",
       x = "Carat", y = "Price in $",
       caption = "Plot shows how price varies with respect to carat")
ggplot(diamonds,aes(x=carat,y=price)) + 
  geom_point((aes(col = cut)), size = 1, shape = 18) +
  geom_smooth(method = "lm",col = "Red") +
  xlim(c(0,3)) + ylim(c(0,20000)) +
  labs(title = "Carat vs Price",
       subtitle = "From dataset diamonds",
       x = "Carat", y = "Price in $",
       caption = "Plot shows how price varies with respect to carat")
ggplot(diamonds,aes(x=carat,y=price,color = cut)) + 
  geom_point(size = 1) +
  xlim(c(0,3)) + ylim(c(0,20000)) +
  geom_smooth() +
  labs(title = "Carat vs Price",
       subtitle = "From dataset diamonds",
       x = "Carat", y = "Price in $",
       caption = "Plot shows how price varies with respect to carat")
ggplot(diamonds,aes(x=carat,y=price,color = cut)) + 
  geom_point(size = 1) +
  xlim(c(0,3)) + ylim(c(0,20000)) +
  geom_smooth() +
  labs(title = "Carat vs Price",
       subtitle = "From dataset diamonds",
       x = "Carat", y = "Price in $",
       caption = "Plot shows how price varies with respect to carat") +
  facet_wrap(~cut,ncol = 2)
A = ggplot(diamonds, aes(x = color)) + 
  geom_bar(fill = "black")
A
A + labs(title = "Plot for count",
         subtitle = "Diamonds Dataset",x = "Color",
         y = "count",caption = "bar plot")
C = ggplot(diamonds, aes(x = color, fill = cut)) +geom_bar()
C
ggplot(diamonds, aes(x=color,fill=cut)) + 
  geom_bar(position = "fill")
ggplot(diamonds, aes(x=color,fill=cut)) + 
  geom_bar(position = "dodge")
ggplot(diamonds, aes(x=color,fill=cut)) + 
  geom_bar(position = "dodge") + coord_flip()
C + facet_grid(~cut)