png(file = "plot4.jpg", width = 480, height = 480)

library(data.table)
subdata<- fread("household_power_consumption.txt")
library(dplyr)
dat<-subdata %>% filter(Date=="1/2/2007"| Date=="2/2/2007")
library(lubridate)
dat$ldate <- dmy_hms(paste(dat$Date, dat$Time))

par(mfrow = c(2, 2), mar = c(4, 4, 2, 1), oma = c(0, 0, 0, 0))

plot(dat$ldate, dat$Global_active_power, type="n", ylab="Global Active Power", xlab="")
lines(dat$ldate, dat$Global_active_power)

plot(dat$ldate, dat$Voltage, type="n", ylab="Voltage", xlab="datetime")
lines(dat$ldate, dat$Voltage)

plot(dat$ldate, dat$Sub_metering_1,type="l", ylab="Energy sub metering", xlab="")
lines(dat$ldate, dat$Sub_metering_2, col="red")
lines(dat$ldate, dat$Sub_metering_3, col="blue")
legend("topright",lty=1,col=c("black","red","blue"),cex = 0.65,bty = "n", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

plot(dat$ldate, dat$Global_reactive_power, type="n", ylab="Global_reactive_power", xlab="datetime")
lines(dat$ldate, dat$Global_reactive_power)


dev.off()
