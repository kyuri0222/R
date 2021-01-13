#HW4-1
install.packages("MASS") 
library(MASS)
library(dplyr)
data(survey)
str(survey)

#Q1
#글씨를 쓰는 손과 박수를 칠때 위에 오는 손이 독집인지 확인하기 위해 분할표 만들기
W.HndClap=xtabs(~W.Hnd+Clap, data=survey)
#카이제곱검정 수행
chisq.test(W.HndClap)

#p값이 0.05보다 크므로 글씨를 쓰는 손과 박수를 칠때 위에 오는 손은 독립이다라는 귀무가설을 기각할 수 없다.

#Q2
head(survey[c("Exer","Smoke")])
#운동과 흡연이 독집인지 확인하기 위해 분할표 만들기
ExerSmoke=xtabs(~Exer+Smoke, data=survey)
#카이제곱검정 수행
chisq.test(ExerSmoke)

#p값이 0.4828로 0.05보다 크므로 운동과 흡연은 독립이다라는 귀무가설을 기각할 수 없다. 
