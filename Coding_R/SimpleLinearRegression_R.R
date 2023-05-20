#import dataset
dataset = read.csv('Salary_Data.csv')

#Splitting dataset into training set and test set
library(caTools)
set.seed(123)

split = sample.split(dataset$Salary,
                     SplitRatio = 0.8)                  #true -> training set, False -> test set

training_set = subset(dataset, split == TRUE)
test_set     = subset(dataset, split == FALSE)

#Fitting Simple linear regression to the training set
linear_model = lm(formula = Salary ~ YearsExperience, 
                  data = training_set)

#Predict the test set results
y_predict = predict(linear_model, newdata = test_set)

y_train_pre = predict(linear_model, newdata = training_set)

plot(training_set$YearsExperience, training_set$Salary, main = "Salary vs Years of Experience", xlab = "Years of Experience", ylab = "Salary", col = "red", cex = 2)
lines(training_set$YearsExperience, y_train_pre, color="blue")

#or can also be plotted using the below code
library(ggplot2)
ggplot() + 
geom_point(aes(x = training_set$YearsExperience, y = training_set$Salary), colour = "red") +
geom_line(aes(x = training_set$YearsExperience, y = y_train_pre), colour = "blue") + 
ggtitle("Salary vs Years of Experience")+
xlab("year of experience")+
ylab("salary")


