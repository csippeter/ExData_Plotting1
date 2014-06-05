data<-read.csv("household_power_consumption.txt", sep=";")
data1<-data[, c(1,2,3)]
data1$Date2<-as.Date(data1$Date, "%d/%m/%Y")
data2<-subset(data1, data1$Date2 == "2007-02-01" | data1$Date2 == "2007-02-02")
data2$DateTime <- paste(data2$Date, data2$Time)
data2$DateTime <- strptime(data2$DateTime, format = "%d/%m/%Y %H:%M:%S")
gap <- as.numeric(paste(data2$Global_active_power))
#quartz() # in Mac
#windows() #in Windows
x11() # in Linux
plot(data2$DateTime, gap, type="l", xlab=" ", ylab="Global Active Power (kilowatts)")
# cs, p, szo are mean Thr Fri Sat in Hungarian!!!
savePlot(filename = paste("plot2.png"),
         type = "png",
         device = dev.cur())
