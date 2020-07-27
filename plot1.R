png(file = "plot1.jpg",width = 480, height = 480)

library(data.table)
subdata<- fread("household_power_consumption.txt")
library(dplyr)
dat<-subdata %>% filter(Date=="1/2/2007"| Date=="2/2/2007")
dat$Date<-as.Date(dat$Date,"%d/%m/%Y")
dat$wday <- weekdays(dat$Date)
with(dat,hist(as.numeric(Global_active_power), col="red", main="Global Active Power", xlab="Global Active Power (killowatts)"))

dev.off()


