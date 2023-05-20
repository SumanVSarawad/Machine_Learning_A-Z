#import dataset
dataset = read.csv('Position_Salaries.csv')
dataset = dataset[2:3]


library(e1071)
svr_regressor = svm(formula = Salary ~ ., data = dataset, type  = 'eps-regression')

y_pred = predict(svr_regressor, data.frame(Level = 6.5))

#Visualizing the SVR results
library(ggplot2)
ggplot() +
    geom_point(aes(x = dataset$Level, y =  dataset$Salary),
               colour = 'red') +
    geom_line(aes(x = dataset$Level, y = predict(svr_regressor, newdata = dataset)), colour = 'blue') +
    ggtitle('Support Vector Regression') +
    xlab('Level') +
    ylab('Salary') 


