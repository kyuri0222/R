install.packages("foreign") 
install.packages("readxl") 
library(foreign) 
library(dplyr) 
library(ggplot2) 
library(readxl) 

#데이터 불러오기
raw_welfare = read.spss(file="koweps_hpwc14_2019_beta1.sav",
                        to.data.frame = T) 
#복사본 만들기 
welfare = raw_welfare 
head(welfare)

#변수명 바꾸기
welfare=rename(welfare, 
               gender=h14_g3, #gender
               birth=h14_g4, #birth year
               marriage=h14_g10, #marriatal status
               religion=h14_g11, #religion
               income=p1402_8aq1, #일한달의 평균 월급
               code_job=h14_eco9, #job code
               code_region=h14_reg7) #region code(7)

welfare=select(welfare, gender, birth, marriage, religion, income, code_job, code_region)




#HW III-1

#성별 항목 이름 부여
welfare$gender = ifelse(welfare$gender ==1, "male", "female")

#나이 파생 변수 생성
welfare$age = 2020 - welfare$birth 

#NA가 아닌 데이터들을 이용하여 나이와 성별에 따른 income 평균값 계산
age_gender_income = welfare %>% 
  filter(!is.na(income)) %>% 
  group_by(gender,age) %>% 
  summarise(mean_income=mean(income))

#계산된 나이와 성별에 따른 남녀 평균 임금을 그래프로 확인
ggplot(data=age_gender_income, aes(x=age, y = mean_income, col=gender))+geom_line()




#HW III-2

#직업별 임금 분석
list_job=read_excel("Job_Code_2020.xlsx", col_names = T, sheet=4) 
head(list_job)
str(list_job)
list_job$code_job=as.numeric(list_job$job_code)

#join job name by job coed job
welfare=left_join(welfare,list_job, id="job_code")

#join 결과 확인
welfare %>% filter(!is.na(job_code) & !is.na(job_name)) %>%
  select(job_code, job_name)  %>%
  head(10)

#직업별 월급 평균표 생성
job_name_income = welfare %>% filter(!is.na(job_name) & !is.na(income)) %>%
  group_by(job_name) %>%
  summarise(mean_income = mean(income))


#월급 내림차순 정렬
#상위 10개 추출
top10 = job_name_income %>%
  arrange(desc(mean_income)) %>%
  head(10) 

#하위 10개 추출
bottom10 = job_name_income %>%
  arrange(desc(mean_income)) %>%
  tail(10)

#상위 10개 + 하위 10개 bind_rows
top10_bottom10=bind_rows(top10,bottom10)

#그래프 생성
ggplot(data=top10_bottom10, aes(x=reorder(job_name, -mean_income),
                                y=mean_income)) + geom_col()+
coord_flip()