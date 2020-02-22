setwd("F://R//Rfiles")
churndata <- read.csv("emp_data.csv")
View(churndata)
attach(churndata)
#y is salary data
#x is churnout data

#visualization
plot(churndata)
 #strong negative correlation

cor(churndata)

#model making

model1 <- lm(Salary_hike ~ Churn_out_rate)
summary(model1)

#to find RMSE is value
sqrt(mean(model1$residuals)^2)
 
#everything is perfect

confint(model1, level = 0.95)

predict(model1, interval = "predict")

#to find values
 a<- data.frame(Churn_out_rate = 90)
r <- predict(model1, a) 
print(r)
