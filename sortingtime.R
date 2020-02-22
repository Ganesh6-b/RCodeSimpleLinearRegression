setwd("F://R//Rfiles")
sortingdata <- read.csv("delivery_time.csv")

View(sortingdata)
attach(sortingdata)
#x is sorting time
#y is delivery time

#visualization 
plot(sortingdata) # moderate positive correlation 
cor(sortingdata)

#building data
model1 <- lm(Delivery.Time ~ Sorting.Time, data = sortingdata)
summary(model1)

#it attains p value 

influence.measures(model1) # to getting rsquared value more than 0.81
library(car)
influenceIndexPlot(model1)

model2 <- lm(Delivery.Time ~ Sorting.Time, data = sortingdata[-c(9),])
summary(model2)

finalmodel <- model2

#to find rmse value

sqrt(mean(model2$residuals)^2)

#confidence interval 

confint(finalmodel, level= 0.95)

#prediction interval

predict(finalmodel, interval = "predict")

#built a data
a <- data.frame(Sorting.Time = 4)
r <- predict(finalmodel, a)
print(r)
