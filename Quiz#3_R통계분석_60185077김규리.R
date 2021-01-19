#url로 자료읽기
url= "https://vincentarelbundock.github.io/Rdatasets/csv/boot/coal.csv"

mycoal=read.csv(url)

#데이터 안의 변수들 속성보기
str(mycoal)

head(mycoal)

#year와 day 변수생성
mycoal$year=floor(mycoal$date)
mycoal$day=floor((mycoal$date-mycoal$year)*365)

#결과보기
head(mycoal)