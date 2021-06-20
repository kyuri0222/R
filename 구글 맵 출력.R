install.packages("ggmap")
library(ggmap)
register_google(key="AIzaSyCRLC_9_kNCSdmzBdpgLLCXSJcJqygM30A")

map<-get_googlemap(center=c(126.975684, 37.572752),
                   maptype="roadmap",
                   zoom=17,
                   size=c(320,320))

ggmap(map,extent="device")
