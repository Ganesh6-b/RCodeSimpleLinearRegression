setwd("F://R//files")
calorydata <- read.csv("calories_consumed.csv")
View(calorydata)
attach(calorydata)
colnames(calorydata)
#y is weight gained
#x is calories consumed

#visualization 
plot(calorydata)
cor(calorydata)
#positive strong correlation 
#creating model
model1 <- lm(Weight.gained..grams. ~ Calories.Consumed, data = calorydata)
summary(model1)

finalmodel <- model1
#to find RMSE
sqrt(mean(model1$residuals)^2)

#confidence interval 
confint(finalmodel, level = 0.95)

#prediction interval
predict(finalmodel, level = "predict")

#to check the correct data

a <- data.frame(Calories.Consumed= 2200)
r <- predict(finalmodel, a)
print(r)

