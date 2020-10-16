##read then subset
#read in the txt file
power<-read.table("household_power_consumption.txt",head=TRUE,na.strings="?",sep=";")
#transform variable Date to class Date
power$Date<-as.Date(power$Date,"%e/%m/%Y")
#subsetting eligibale cases
power<-power[power$Date>=as.Date("2007-02-01","%Y-%m-%d")&power$Date<=as.Date("2007-02-02","%Y-%m-%d"),]
##making plot2
#get weekday name
power$weekday<-weekdays(power$Date)
library(lubridate)
power$Time<-hms(power$Time)
power$ind<-order(power$Date,power$Time)
png(file="plot2.png",width=480,height=480,units = "px")
plot(power$ind,power$Global_active_power,type="l",xlab = "Global Active Power(kilowatts)",ylab = "Global Active Power(kilowatts)",xaxt="n")
axis(1,outer=TRUE,at=c(1,1440,2880),labels=c("Thu","Fri","Sat"),pos=c(-0.065,0))
dev.off()