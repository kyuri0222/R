library(ggplot2)                                    
library(dplyr)
mpg=as.data.frame(ggplot2::mpg)                     #gglot2안에 있는 mpg를 가져와서 나만의 mpg를 만들겠다
head(mpg)                                           #데이터 앞부분 출력

#Q1
df = mpg %>% select(class,cty)                      #class,cty 변수 추출하여 새로운 데이터 생성
head(df)                                            #데이터 앞부분 출력

df_suv = df %>% filter(class == "suv")              #df에서 class가 suv인 행 추출
df_compact = df %>% filter(class == "compact")      #df에서 class가 compact인 행 추출

mean(df_suv$cty)                                    #suv의 cty평균
mean(df_compact$cty)                                #compact의 cty평균

#따라서 compact의 도시연비가 더 높다.

#Q2
mpg_audi = mpg %>% filter(manufacturer == "audi")   #audi에서 생산한 자동차 추출
mpg_audi %>% arrange(desc(hwy)) %>% head(5)         #hwy 내림차순 정렬하고 1~5위 데이터 출력

#Q3
mpg_compact = mpg %>% filter(class == "compact")    #class가 compact인 행 추출
mpg_compact %>% group_by(manufacturer) %>% summarise(number=n()) %>% arrange(desc(number)) %>% head(5)
#집단별로 분리한뒤 요약, number에 따라 내림차순 정리, 상위 5개 추출

#따라서 compact 차종을 가장 많이 생산하는 회사는 audi이다. 