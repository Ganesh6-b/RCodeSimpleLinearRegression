setwd("F://R//Rfiles")
salarydata <- read.csv("Salary_Data.csv")
View(salarydata)
attach(salarydata)
#x is years experience
#y is salary 

#visualizations

plot(salarydata)
cor(salarydata)
#strong positive correlation

#model building
model1 <- lm(log(Salary) ~ YearsExperience)
summary(model1)

#RMSE value
sqrt(mean(model1$residuals) ^ 2)

#everything is perfect
finalmodel<- model1
#confidence intrval
confint(finalmodel, level = 0.95)
#prediction interval
predict(model1, interval = "predict")

#deployment stuff
a <- data.frame(YearsExperience = 1.2)
r <- predict(finalmodel, a)
print(exp(r))
