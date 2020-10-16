##read then subset
#read in the txt file
power<-read.table("household_power_consumption.txt",head=TRUE,na.strings="?",sep=";")
#transform variable Date to class Date
power$Date<-as.Date(power$Date,"%e/%m/%Y")
#subsetting eligibale cases
power<-power[power$Date>=as.Date("2007-02-01","%Y-%m-%d")&power$Date<=as.Date("2007-02-02","%Y-%m-%d"),]
##making plot4
#get weekday name
power$weekday<-weekdays(power$Date)
library(lubridate)
power$Time<-hms(power$Time)
power$ind<-order(power$Date,power$Time)
png(file="plot4.png",width=480,height=480,units = "px")
par(mfrow=c(2,2))
#plot1,1
plot(power$ind,power$Global_active_power,type="l",xlab = "",ylab = "Global Active Power",xaxt="n")
axis(1,outer=TRUE,at=c(1,1440,2880),labels=c("Thu","Fri","Sat"),pos=c(-0.065,0))
#plot1,2
plot(power$ind,power$Voltage,type="l",xlab = "datetime",ylab = "Voltage",xaxt="n")
axis(1,outer=TRUE,at=c(1,1440,2880),labels=c("Thu","Fri","Sat"),pos=c(0,0))
#plot2,1
plot(power$ind,power$Sub_metering_1,type="n",xlab = "",ylab = "Energy sub metering",xaxt="n")
lines(power$ind,power$Sub_metering_1,type="l",xlab = "",ylab = "",xaxt="n")
lines(power$ind,power$Sub_metering_2,type="l",xlab = "",ylab = "",xaxt="n",col="red")
lines(power$ind,power$Sub_metering_3,type="l",xlab = "",ylab = "",xaxt="n",col="blue")
axis(1,outer=TRUE,at=c(1,1440,2880),labels=c("Thu","Fri","Sat"),pos=c(-1.5,0))
legend("topright",lwd=1,bty="n", col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
#plot2,2
plot(power$ind,power$Global_reactive_power,type="l",xlab = "datetime",ylab = "Global_reactive_power",xaxt="n")
axis(1,outer=TRUE,at=c(1,1440,2880),labels=c("Thu","Fri","Sat"),pos=c(-0.02,0))
dev.off()