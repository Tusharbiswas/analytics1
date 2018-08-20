#partition the data into train and test

mtcars
library(caret)
index=createDataPartition(y=mtcars$am,p=0.7,list=F)
train=mtcars[index,]
test=mtcars[-index]
nrow(train)
nrow(test)
nrow(train)+nrow(test)

library(olsrr)
fit=lm(mpg~disp+hp+wt+qsec,data=train)
k=ols_step_all_possible(fit)
plot(k)
k
summary(lm(mpg~wt,data=train))
summary(lm(mpg~wt+hp,data=train))

library(gvlma)
gvmodel=gvlma(fit)
gvmodel
summary(fit)
?cbind

finalmodel=lm(mpg~wt+hp,data=train)
(predictedvalues=predict(finalmodel,ndata=test))
cbind(test$mpg,predictedvalues)
