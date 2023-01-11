library(fastDummies)
library(rpart)
library(rpart.plot)
library(caret)
library(ggplot2)
#PART A
auction_data= read.csv("eBayAuctions.csv",header = T)
dim(auction_data)

#convert duration to categorical variable
auction_data=dummy_cols(auction_data,select_columns='Duration')
auction_data=subset(auction_data,select=-c(4))
head(auction_data)

#divide data into training and validation data
set.seed(4)
sample <- sample(c(TRUE, FALSE), nrow(auction_data), replace=TRUE, prob=c(0.6,0.4))
train_data  <- auction_data[sample, ]
val_data   <- auction_data[!sample, ]
dim(train_data)
dim(val_data)
head(train_data)

#classification tree
class.tree <- rpart(Competitive. ~ ., data = train_data,
                    control = rpart.control(maxdepth = 7, minbucket=50), method = "class")
prp(class.tree, type = 1, extra = 1, split.font = 1, varlen = -10)

#Best pruned tree
pruned.tree=prune(class.tree,cp = class.tree$cptable[which.min(class.tree$cptable[,"xerror"]),"CP"])
length(pruned.tree$frame$var[pruned.tree$frame$var == "<leaf>"])
prp(pruned.tree, type = 1, extra = 1, split.font = 1, varlen = -10,tweak = 2)

#predict values on validation data and confusion matrix
predicted_vals=predict(class.tree, val_data, type='class')
predicted_vals
confusionMatrix(as.factor(predicted_vals), as.factor(val_data$Competitive.))
#accuracy =84.63%
printcp(class.tree)

#PART D
auction_data= read.csv("eBayAuctions.csv",header = T)
#convert duration to categorical variable
auction_data=dummy_cols(auction_data,select_columns='Duration')
auction_data=subset(auction_data,select=-c(4))
head(auction_data)
#removing category and currency because they have least impact on competitive
auction_data=subset(auction_data,select=-c(1:2))
head(auction_data)
set.seed(50)
sample1 <- sample(c(TRUE, FALSE), nrow(auction_data), replace=TRUE, prob=c(0.6,0.4))
train_data1  <- auction_data[sample1, ]
val_data1   <- auction_data[!sample1, ]
dim(train_data1)
dim(val_data1)
head(train_data1)
class.tree1 <- rpart(Competitive. ~ ., data = train_data1,
                    control = rpart.control(maxdepth = 7, minbucket=50), method = "class")
prp(class.tree1, type = 1, extra = 1, split.font = 1, varlen = -10)

pruned.tree1=prune(class.tree1,cp = class.tree1$cptable[which.min(class.tree1$cptable[,"xerror"]),"CP"])
length(pruned.tree1$frame$var[pruned.tree1$frame$var == "<leaf>"])
prp(pruned.tree1, type = 1, extra = 1, split.font = 1, varlen = -10)
#for accuracy
predicted_vals1=predict(class.tree1, val_data1, type='class')
predicted_vals1
confusionMatrix(as.factor(predicted_vals1), as.factor(val_data1$Competitive.))

#scatter plot
ggplot(auction_data,aes(x=OpenPrice,y=ClosePrice,col=Competitive.))+geom_point()
