##read then subset
#read in the txt file
power<-read.table("household_power_consumption.txt",head=TRUE,na.strings="?",sep=";")
#transform variable Date to class Date
power$Date<-as.Date(power$Date,"%e/%m/%Y")
#subsetting eligibale cases
power<-power[power$Date>=as.Date("2007-02-01","%Y-%m-%d")&power$Date<=as.Date("2007-02-02","%Y-%m-%d"),]
##making plot1
png(file="plot1.png",width=480,height=480,units = "px")
hist(power$Global_active_power,col="red",main="Global Active Power",xlab = "Global Active Power(kilowatts)")
dev.off()