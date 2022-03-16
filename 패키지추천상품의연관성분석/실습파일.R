# 데이터 및 패키지 준비
setwd("/Users/KyuriKim/kyuri_git/r_exercise/패키지추천상품의연관성분석")
install.packages("arules")
library(arules)

# 데이터 읽기
result <- read.transactions("mybasket.csv", format = "basket",sep = ",")
result
summary(result)
image(result)

#알고리즘 적용 / #연관규칙 해석
as(result, "data.frame")
rules <- apriori(result, parameter = list(supp=0.1, conf = 0.1))
inspect(rules)

#시각화
install.packages("arulesViz")
library(arulesViz)
plot(rules)
plot(rules,method = "grouped")
plot(rules,method = "graph", control = list(type="itmes"))