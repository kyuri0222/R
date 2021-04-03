library(ggplot2)

# 복사본 만들기
df = data.frame(airquality)

# Day를 factor로 데이터 형 변환
df$Day = factor(df$Day, levels=c(1:31), ordered=TRUE)
# Month를 factor로 데이터 형 변환
df$Month = factor(df$Month, levels=5:9, labels=month.abb[5:9], ordered=TRUE)

# NA값 있는지 확인
table(is.na(df))
# 결측치가 없는 데이터만 추출
df = na.omit(df)

# Ozone이 normal분포인지 확인
ggplot(data=df) + geom_histogram(mapping=aes(Ozone))
# data transformation을 통해 normal한 분포 만들기
df$Ozone.sqrt = sqrt(df$Ozone)
# Ozone.sqrt가 normal분포인지 확인
ggplot(data=df) + geom_histogram(mapping=aes(Ozone.sqrt))

# Solar.R이 normal분포인지 확인
ggplot(data=df) + geom_histogram(mapping=aes(Solar.R))

# Wind가 normal분포인지 확인
ggplot(data=df) + geom_histogram(mapping=aes(Wind))

# Temp가 normal분포인지 확인
ggplot(data=df) + geom_histogram(mapping=aes(Temp))

# 열 변수명 순서 확인
head(df)
# 총 4개의 변수 Solar.R, Wind, Temp, Ozone.sqrt 추출
df2 <- df[,c(2,3,4,7)]

# Correlation의 계수값을 소수 2번째 자리까지 반올림
round(cor(df2), 2)

# 변수들 간의 상관관계 그래프로 나타내기
# Solar.R과 Wind의 상관관계
qplot(Solar.R, Wind, data=df, geom="point", color=Month)

# Solar.R과 Temp의 상관관계
qplot(Solar.R, Temp, data=df, geom="point", color=Month)

# Solar.R과 Ozone.sqrt의 상관관계
qplot(Solar.R, Ozone.sqrt, data=df, geom="point", color=Month)

# Wind와 Temp의 상관관계
qplot(Wind, Temp, data=df, geom="point", color=Month)

# Wind와 Ozone.sqrt의 상관관계
qplot(Wind, Ozone.sqrt, data=df, geom="point", color=Month)

# Temp와 Ozone.sqrt의 상관관계
qplot(Temp, Ozone.sqrt, data=df, geom="point", color=Month)