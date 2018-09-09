

# install.packages("dummies")
library(dummies)

setwd("X:/Side_Projects/Telcome")
train <- read.csv("Churn.csv")

head(train)

#Output the data frame given that there are some missing data
miss = sapply(train, function(x) length(which(is.na(x))))
miss.df = data.frame(miss[miss>0])
names(miss.df) = "number_of_missing_values"
miss.df

#Total number of entries 
n = dim(train)[1]

#Check as a percentage of missing values 
miss.df.p = 100*miss.df/n
miss.df.p

#Explore the Total Charges variable 
#Total charges equal to total amount charge to the customers 
train[is.na(train$TotalCharges),]

#For all these customers whose total charges qualt to NA
#The tenures is 0: which means it's their first month singed with the company 
#and they haven't been charged yet
#We decided to remove these rows, since it's very small set and won't have siginifcant effect on our anlysis
train.new = na.omit(train)


#Now let us check for levels, see are we skipping some factors as numerical data 
lv = sapply(train.new, function(x) levels(x))
lv

#Senior Citizon should be a categorical varaible 
train.new$SeniorCitizen = factor(train.new$SeniorCitizen)

#Make lots of plots 
for ( i in names(train.new)) {plot(train.new[[i]], train.new$Churn,xlab=i, ylab="Churn")}


dim(train.new)
# [1] 7032   21
set.seed(5)
train.recs <- sample(1:7032, size=3516)  # select 3516 record number at random 
data.train <- train.new[train.recs,]
data.test <- train.new[-train.recs,]  #The set to test the models on 

#The data is cleaned up and ready to use. 
write.csv(data.train, file="train_cleaned.csv", row.names=FALSE)
write.csv(data.test, file="test_cleaned.csv", row.names=FALSE)


#Dummy version 
name.1 = names(Filter(is.factor, data.train))
dum.1 = dummy.data.frame(data.train, names=name.1)
write.csv(dum.1, file="train_cleaned_dummy.csv", row.names=FALSE)

name.2 = names(Filter(is.factor, data.test))
dum.2 = dummy.data.frame(data.test, names=name.1)
write.csv(dum.1, file="test_cleaned_dummy.csv", row.names=FALSE)
