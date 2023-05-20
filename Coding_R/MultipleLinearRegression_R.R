#import dataset
dataset = read.csv('50_Startups.csv')

dataset$State = factor(dataset$State,
                       levels = c('New York', 'California', 'Florida'),
                       labels = c(1, 2, 3))

#Splitting dataset into training set and test set
library(caTools)
set.seed(123)

split = sample.split(dataset$Profit,
                     SplitRatio = 0.8)                  #true -> training set, False -> test set

training_set = subset(dataset, split == TRUE)
test_set     = subset(dataset, split == FALSE)

#Fitting Simple linear regression to the training set
linear_model = lm(formula = Profit ~ .,                                #can be written as fromula = Profit ~ R.D.Spend + Administration + Marketing.Spend + State
                  data = training_set)

#Predict the test set results
y_predict = predict(linear_model, newdata = test_set)

#Building optimal model using Backward Elimination
linear_model = lm(formula = Profit ~ R.D.Spend + Administration + Marketing.Spend + State,
                  data = dataset)

summary(linear_model)

linear_model = lm(formula = Profit ~ R.D.Spend + Administration + Marketing.Spend,
                  data = dataset)

summary(linear_model)

linear_model = lm(formula = Profit ~ R.D.Spend + Marketing.Spend,
                  data = dataset)

summary(linear_model)

linear_model = lm(formula = Profit ~ R.D.Spend,
                  data = dataset)

summary(linear_model)
#-----------------------------------------------------------------------------------------------------------------------------
#Backward Elimination using functions
#backwardElimination <- function(x, sl) {
#    numVars = length(x)
#    for (i in c(1:numVars)){
#      regressor = lm(formula = Profit ~ ., data = x)
#      maxVar = max(coef(summary(regressor))[c(2:numVars), "Pr(>|t|)"])
#      if (maxVar > sl){
#        j = which(coef(summary(regressor))[c(2:numVars), "Pr(>|t|)"] == maxVar)
#        x = x[, -j]
#      }
#      numVars = numVars - 1
#    }
#    return(summary(regressor))
#  }
#  
#  SL = 0.05
#  dataset = dataset[, c(1,2,3,4,5)]
#  backwardElimination(training_set, SL)