#import dataset
dataset = read.csv('Position_Salaries.csv')
dataset = dataset[2:3]

#install.packages('rpart')
library(randomForest)
regressor = randomForest(x = dataset[1], y = dataset$Salary, ntree = 10)

y_pred = predict(regressor, data.frame(Level = 6.5))

#Visualizing the Random Forest Regression results
library(ggplot2)
X_grid = seq(min(dataset$Level), max(dataset$Level), 0.1)
ggplot() +
    geom_point(aes(x = dataset$Level, y =  dataset$Salary),
               colour = 'red') +
    geom_line(aes(x = X_grid, y = predict(regressor, newdata = data.frame(Level = X_grid))), colour = 'blue') +
    ggtitle('Random Forest Regression') +
    xlab('Level') +
    ylab('Salary') 


