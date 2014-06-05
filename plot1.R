data<-read.csv("household_power_consumption.txt", sep=";")
data1<-data[, c(1,3)]
data1$Date2<-as.Date(data1$Date, "%d/%m/%Y")
data2<-subset(data1, data1$Date2 == "2007-02-01" | data1$Date2 == "2007-02-02")
#quartz() # in Mac
#windows() #in Windows
x11() # in Linux
hist(as.numeric(paste(data2$Global_active_power)), col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

savePlot(filename = paste("plot1.png"),
         type = "png",
         device = dev.cur())
