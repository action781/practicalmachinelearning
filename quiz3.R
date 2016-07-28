library(caret)
library(AppliedPredictiveModeling)
set.seed(3433)
data(AlzheimerDisease)
adData = data.frame(diagnosis,predictors)
inTrain = createDataPartition(adData$diagnosis, p = 3/4)[[1]]
training = adData[ inTrain,]
testing = adData[-inTrain,]

smalltrain <- training[,c(58:69,1)]

modelfit <- train(smalltrain$diagnosis~., method = "glm", preProcess = "pca", data = smalltrain)
confusionMatrix(testing$diagnosis, predict(modelfit, testing))

modelfit2 <- train(smalltrain$diagnosis~., method = "glm", data = smalltrain)
confusionMatrix(testing$diagnosis, predict(modelfit2, testing))

1. 
library(AppliedPredictiveModeling)
data(AlzheimerDisease)

adData = data.frame(diagnosis,predictors)
trainIndex = createDataPartition(diagnosis, p = 0.50,list=FALSE)
training = adData[trainIndex,]
testing = adData[-trainIndex,] #good

adData = data.frame(diagnosis,predictors)
train = createDataPartition(diagnosis, p = 0.50,list=FALSE)
test = createDataPartition(diagnosis, p = 0.50,list=FALSE) #bad

adData = data.frame(diagnosis,predictors)
trainIndex = createDataPartition(diagnosis, p = 0.50)
training = adData[trainIndex,]
testing = adData[-trainIndex,] #bad

adData = data.frame(predictors)
trainIndex = createDataPartition(diagnosis,p=0.5,list=FALSE)
training = adData[trainIndex,]
testing = adData[-trainIndex,] #bad


2.  
library(AppliedPredictiveModeling)
data(concrete)
library(caret)
set.seed(1000)
inTrain = createDataPartition(mixtures$CompressiveStrength, p = 3/4)[[1]]
training = mixtures[ inTrain,]
testing = mixtures[-inTrain,]

#DEFINITELY non-random pattern

There is a non-random pattern in the plot of the outcome versus index. #NO

There is a non-random pattern in the plot of the outcome versus index that is perfectly explained by the Age variable. #WRONG

There is a non-random pattern in the plot of the outcome versus index that is perfectly explained by the FlyAsh variable. #WRONG

There is a non-random pattern in the plot of the outcome versus index that does not appear to be perfectly explained by any predictor suggesting a variable may be missing. #CORRECT


3.  
library(AppliedPredictiveModeling)
data(concrete)
library(caret)
set.seed(1000)
inTrain = createDataPartition(mixtures$CompressiveStrength, p = 3/4)[[1]]
training = mixtures[ inTrain,]
testing = mixtures[-inTrain,]

There are values of zero so log() will give -inf
There are a large number of values that are the same and log (+1) wont change that

4.  90% of variance by 9 P comps

5.  nonpca: 0.65 (pretty sure)
pca:  0.72 (not sure, think its 0.71)
but also pretty sure nonpca should be less accurate than pca