library(readr) 
library(dplyr)

p1.train = read.csv("WA_Fn-UseC_-Telco-Customer-Churn.csv")
#p1.predict = read_csv("test.csv")

set.seed(5)
sub <- sample(1:7043,size=3521)
p1.train <- p1.train[sub,]     # Select subset for cross-validation
p1.test <- p1.train[-sub,]


lv = sapply(p1.train, function(x) levels(x))
lv
p1.train$SeniorCitizen<-factor(p1.train$SeniorCitizen)
class(p1.train$SeniorCitizen)
lv = sapply(p1.train, function(x) levels(x))
lv
# x1<-p1.train$gender
# x2<-p1.train$SeniorCitizen
# x4<-p1.train$Dependents
# x5<-p1.train$tenure
# x6<-p1.train$PhoneService
# x7<-p1.train$MultipleLines
# x8<-p1.train$InternetService
# x9<-p1.train$OnlineSecurity
# x10<-p1.train$OnlineBackup
# x11<-p1.train$DeviceProtection
# x12<-p1.train$TechSupport
# x13<-p1.train$StreamingTV
# x14<-p1.train$StreamingMovies
# x15<-p1.train$Contract
# x16<-p1.train$PaperlessBilling
# x17<-p1.train$PaymentMethod
# x18<-p1.train$MonthlyCharges
# x19<-p1.train$TotalCharges
# y<-p1.train$Churn


p1.train[is.na(p1.train$TotalCharges),]
p1.train1<- na.omit(p1.train)

p1.lm <- glm(Churn~, family="binomial"(link='logit'),data=p1.train1)
#summary(p1.lm)



