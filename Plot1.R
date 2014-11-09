data<-read.table("household_power_consumption.txt",sep=";",na.strings="?",header=TRUE)
data$Date<-as.Date(data$Date,"%d/%m/%Y")
mydata<-data[data$Date=="2007-02-01"|data$Date=="2007-02-02",]
png("Plot1.png")
hist(mydata$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.off()