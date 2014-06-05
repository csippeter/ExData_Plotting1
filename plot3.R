data<-read.csv("household_power_consumption.txt", sep=";")
data1<-data[, c(1,2,7,8,9)]
data1$Date2<-as.Date(data1$Date, "%d/%m/%Y")
data2<-subset(data1, data1$Date2 == "2007-02-01" | data1$Date2 == "2007-02-02")
data2$DateTime <- paste(data2$Date, data2$Time)
data2$DateTime <- strptime(data2$DateTime, format = "%d/%m/%Y %H:%M:%S")
sub1<-as.numeric(paste(data2$Sub_metering_1))
sub2<-as.numeric(paste(data2$Sub_metering_2))
sub3<-as.numeric(paste(data2$Sub_metering_3))
# quartz() # in Mac
# windows() # in Windows
x11() #in Linux
plot(data2$DateTime, sub1, type="l", xlab=" ", ylab="Energy sub metering")
lines(data2$DateTime, sub2, col="red")
lines(data2$DateTime, sub3, col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1,1), col=c("black", "red", "blue")) 
# cs p szo are meaning Thr Fri Sat in Hungarian!!!
savePlot(filename = paste("plot3.png"),
         type = "png",
         device = dev.cur())
