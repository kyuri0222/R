###1
t.test(breaks~wool, data=warpbreaks)
# 유의확률(p값)이 0.05보다 크므로 귀무가설 채택
# 차이가 없다고 말할 수 있다.

###2
#tapply()로 각 tension의 breaks 평균 확인 
with(warpbreaks, tapply(breaks,tension,mean))
anova(lm(breaks~tension, data=warpbreaks))
# 유의확률(p값)이 0.05보다 작으므로 귀무가설 기각
# 차이가 있다고 말할 수 있다. 