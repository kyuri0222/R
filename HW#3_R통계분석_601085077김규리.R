library(dplyr)
library(ggplot2)

getwd()
welfare = read.csv("welfare.csv")
head(welfare)

#[Part1]
welfare$gender = ifelse(welfare$gender == 1, "male", "female")    # 성별(gender) 데이터 이름 부여

welfare$income = ifelse(welfare$income %in% c(0,9999), NA, welfare$income) #정상범위 아닌 값들 NA처리

head(welfare) #데이터 확인

gender_income = welfare %>% filter(!is.na(income)) %>% group_by(gender) %>% summarise(mean_income=mean(income))
#NA가 아닌 데이터들을 이용하여 성별에 따른 income 평균값 계산

gender_income #결과값 확인

ggplot(data=gender_income, aes(x=gender, y = mean_income))+geom_bar(stat="identity")
#계산된 남녀 평균 임금을 그래프로 확인

#[Part2]
welfare$age = 2020 - welfare$birth #나이 파생 변수 생성

age_gender_income = welfare %>% filter(!is.na(income)) %>% group_by(gender,age) %>% summarise(mean_income=mean(income))
#NA가 아닌 데이터들을 이용하여 나이와 성별에 따른 income 평균값 계산

ggplot(data=age_gender_income, aes(x=age, y = mean_income, col=gender))+geom_line()
#계산된 나이와 성별에 따른 남녀 평균 임금을 그래프로 확인