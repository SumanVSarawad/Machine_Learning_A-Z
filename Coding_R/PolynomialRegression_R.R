#import dataset
dataset = read.csv('Position_Salaries.csv')
dataset = dataset[2:3]

#Fitting Linear Regression to the dataset
linear_model = lm(formula = Salary  ~ ., 
                  data = dataset)

#Fitting Polynomial Regression to the dataset
dataset$Level2 = dataset$Level ^ 2
dataset$Level3 = dataset$Level ^ 3
dataset$Level4 = dataset$Level ^ 4
poly_reg = lm(formula = Salary ~ .,
               data = dataset)

#Visualizing the Linear Regression results
library(ggplot2)
ggplot() +
    geom_point(aes(x = dataset$Level, y =  dataset$Salary),
               colour = 'red') +
    geom_line(x = dataset$Level, y = predict(linear_model, newdata = dataset), colour = 'blue') +
    ggtitle('Linear Regg') +
    xlab('Level') +
    ylab('Salary') 

#Visualizing the Polynomial Regression results
ggplot() +
    geom_point(aes(x = dataset$Level, y =  dataset$Salary),
               colour = 'red') +
    geom_line(x = dataset$Level, y = predict(poly_reg, newdata = dataset), colour = 'blue') +
    ggtitle('Poly Regg') +
    xlab('Level') +
    ylab('Salary')

#Predicting a new result with linear regression
y_pred = predict(linear_model, data.frame(Level = 6.5))

#Predicting a new result with Polynomial regression
y_pred_p = predict(poly_reg, data.frame(Level = 6.5, Level2 = 6.5^2, Level3 = 6.5^3, Level4 = 6.5^4))
