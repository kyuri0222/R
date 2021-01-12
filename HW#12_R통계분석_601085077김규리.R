#60185077 김규리

install.packages("dplyr")
library(dplyr)
#ad.csv파일에서 데이터 불러오기
ds = read.csv("ad.csv")
df = ds %>% select(TV ,radio, newspaper, sales)

summary(df)
pairs(df)

# m1. TV 단순 회귀 모델
m1 = lm(sales ~ TV, data = df)
summary(m1)
par(mfrow=c(2,2))
plot(m1)

install.packages("interactions")
library (interactions)
interact_plot(df,pred = "sales", modx = "TV", plot.points = TRUE)


# m2. radio 단순 회귀 모델
m2 = lm(sales ~ radio, data = df)
summary(m2)
par(mfrow=c(2,2))
plot(m2)

# m3. newspaper 단순 회귀 모델
m3 = lm(sales ~ newspaper, data = df)
summary(m3)
par(mfrow=c(2,2))
plot(m3)

# m4. TV,radio 다중 회귀 모델
m4 = lm(sales ~ TV + radio, data = df)
summary(m4)
par(mfrow=c(2,2))
plot(m4)

# m5. TV,newspaper 다중 회귀 모델
m5 = lm(sales ~ TV + newspaper, data = df)
summary(m5)
par(mfrow=c(2,2))
plot(m5)

# m6. radio, newspaper 다중 회귀 모델
m6 = lm(sales ~ radio + newspaper, data = df)
summary(m6)
par(mfrow=c(2,2))
plot(m6)

# m7. TV, radio, newspaper 다중 회귀 모델
m7 = lm(sales ~ TV +radio + newspaper, data = df)
summary(m7)
##p값이 0.05보다 작으므로 대립가설 채택
##광고와 판매량의 관계는 유의하다.
par(mfrow=c(2,2))
plot(m7)

#m8. 
m8 = lm(sales ~ (TV + radio + newspaper)^2, data = df)
summary(m8)
par(mfrow=c(2,2))
plot(m8)

#training data & testind data
set.seed(100)
trainingRowIndex = sample(1:nrow(df),0.6*nrow(df))
trainingData = df[trainingRowIndex, ]
testData = df[-trainingRowIndex,]

result = lm(sales ~ (TV + radio + newspaper)^2, data = trainingData)

salesPred = predict(result, testData)

actuals_preds=data.frame(cbind(actuals = testData$sales, predict = salesPred))
head(actuals_preds)
correaltion_accuracy = cor(actuals_preds)
correaltion_accuracy