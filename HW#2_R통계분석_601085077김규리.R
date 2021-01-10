library(dplyr)
library(ggplot2)

# < Q1 >

# 데이터 불러오기
mpg = as.data.frame(ggplot2::mpg)

# %>%filter를 이용하여 displ 4 이하와 5이상 추출하기
mpg1 = mpg %>% filter(displ <= 4)  
mpg2 = mpg %>% filter(displ >= 5)  
 
#mpg1 과 mpg2의 고속도로 연비 평균 각각 구하기
mean(mpg1$hwy)
mean(mpg2$hwy)

#따라서 mpg1 즉, 배기량이 4이하인 자동차의 고속도로 연비가 평균적으로 더 높다.


# < Q2 >

#audi와 toyata 추출하기
audi = mpg %>% filter(manufacturer == "audi")     
toyota = mpg %>% filter(manufacturer == "toyota") 

#audi와 toyota 도시연비의 평균 구하기  
mean(audi$cty)    
mean(toyota$cty) 

#따라서 토요타의 도시연비가 평균적으로 더 높다.


# < Q3 >

#도로유형을 통틀은 연비의 평균 변수 fuel 만들기, 높은 순으로 정렬한 뒤, 위에서 5개만 보기
mpg %>% mutate(fuel=(cty+hwy)/2) %>% arrange(desc(fuel)) %>% head(5)

#따라서 도로유형을 통틀어 연비가 가장 높은 자동차는 폭스바겐의 뉴비틀이다.