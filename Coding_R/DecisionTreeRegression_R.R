#import dataset
dataset = read.csv('Position_Salaries.csv')
dataset = dataset[2:3]

#install.packages('rpart')
library(rpart)
dt_regressor = rpart(formula = Salary ~ ., data = dataset, control = rpart.control(minsplit = 1))

y_pred = predict(dt_regressor, data.frame(Level = 6.5))

#Visualizing the Decision Tree Regression results
library(ggplot2)
X_grid = seq(min(dataset$Level), max(dataset$Level), 0.1)
ggplot() +
    geom_point(aes(x = dataset$Level, y =  dataset$Salary),
               colour = 'red') +
    geom_line(aes(x = X_grid, y = predict(dt_regressor, newdata = data.frame(Level = X_grid))), colour = 'blue') +
    ggtitle('Decision Tree Regression') +
    xlab('Level') +
    ylab('Salary') 


