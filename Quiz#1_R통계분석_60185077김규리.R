#ggplot2라는 package를 설치
install.packages("ggplot2") 

#ggplo2이라는 package가 있는지 알려줌
library(ggplot2)

#gglot2안에 있는 mpg를 가져와서 나만의 mpg를 만들겠다
mpg=as.data.frame(ggplot2::mpg)

#데이터 앞부분 출력
head(mpg)



#통합 연비 파생 변수 생성
mpg$total=(mpg$cty+mpg$hwy)/2

#모든 자동차 통합 연비 평균 생성
m1 = mean(mpg$total); m1

#고연비인지 아닌지 판단
mpg$test=ifelse(mpg$total >= m1, "pass","fail") 

#데이터 앞부분 출력
head(mpg)

#pass가 몇개이고 fail이 몇개인지 계산
table(mpg$test)

#따라서 도로유형을 통틀어 고연비(평균이상) 합격판정을 받은 자동차는 총 111개이다.
