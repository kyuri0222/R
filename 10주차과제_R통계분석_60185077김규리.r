library(ggplot2)

# ���纻 �����
df = data.frame(airquality)

# Day�� factor�� ������ �� ��ȯ
df$Day = factor(df$Day, levels=c(1:31), ordered=TRUE)
# Month�� factor�� ������ �� ��ȯ
df$Month = factor(df$Month, levels=5:9, labels=month.abb[5:9], ordered=TRUE)

# NA�� �ִ��� Ȯ��
table(is.na(df))
# ����ġ�� ���� �����͸� ����
df = na.omit(df)

# Ozone�� normal�������� Ȯ��
ggplot(data=df) + geom_histogram(mapping=aes(Ozone))
# data transformation�� ���� normal�� ���� �����
df$Ozone.sqrt = sqrt(df$Ozone)
# Ozone.sqrt�� normal�������� Ȯ��
ggplot(data=df) + geom_histogram(mapping=aes(Ozone.sqrt))

# Solar.R�� normal�������� Ȯ��
ggplot(data=df) + geom_histogram(mapping=aes(Solar.R))

# Wind�� normal�������� Ȯ��
ggplot(data=df) + geom_histogram(mapping=aes(Wind))

# Temp�� normal�������� Ȯ��
ggplot(data=df) + geom_histogram(mapping=aes(Temp))

# �� ������ ���� Ȯ��
head(df)
# �� 4���� ���� Solar.R, Wind, Temp, Ozone.sqrt ����
df2 <- df[,c(2,3,4,7)]

# Correlation�� ������� �Ҽ� 2��° �ڸ����� �ݿø�
round(cor(df2), 2)

# ������ ���� ������� �׷����� ��Ÿ����
# Solar.R�� Wind�� �������
qplot(Solar.R, Wind, data=df, geom="point", color=Month)

# Solar.R�� Temp�� �������
qplot(Solar.R, Temp, data=df, geom="point", color=Month)

# Solar.R�� Ozone.sqrt�� �������
qplot(Solar.R, Ozone.sqrt, data=df, geom="point", color=Month)

# Wind�� Temp�� �������
qplot(Wind, Temp, data=df, geom="point", color=Month)

# Wind�� Ozone.sqrt�� �������
qplot(Wind, Ozone.sqrt, data=df, geom="point", color=Month)

# Temp�� Ozone.sqrt�� �������
qplot(Temp, Ozone.sqrt, data=df, geom="point", color=Month)