##Read data
data<-read.table("household_power_consumption.txt",sep=";",na.strings="?",header=TRUE)

##convert Date column to be of the "Date" class, then subset the data we need(2007-02-01 to 2007-02-02) 
##from the raw data.
data$Date<-as.Date(data$Date,"%d/%m/%Y")
mydata<-data[data$Date=="2007-02-01"|data$Date=="2007-02-02",]

##Open a png graphical device and make the plot
png("Plot1.png")
hist(mydata$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.off()