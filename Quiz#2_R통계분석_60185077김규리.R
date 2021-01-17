#ggplo2와 dplyr이라는 package가 있는지 알려줌
library(ggplot2)
library(dplyr)

#gglot2안에 있는 midwest를 가져와서 나만의 midwest를 만들겠다
midwest=as.data.frame(ggplot2::midwest)

#데이터 앞부분 출력
head(midwest)

#각 county별로 전체 인구 대비 아시아 인구 백분율 파생 변수 생성
midwest$perasian=midwest$popasian/midwest$poptotal*100

#아시아 인구 백분율의 전체평균 파생 변수 생성
m1 = mean(midwest$perasian); m1

#large인지 small인지 판단
midwest$asialevel = ifelse(midwest$perasian > m1, "large","small")

#데이터 앞부분 출력
head(midwest)

#pass가 몇개이고 fail이 몇개인지 계산
table(midwest$asialevel)

#그래프로 보기
qplot(midwest$aisalevel)

#따라서 large에 해당하는 지역은 119개이고, small에 해당하는 지역은 318개이다.