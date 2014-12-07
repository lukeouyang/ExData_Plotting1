##Read data
data<-read.table("household_power_consumption.txt",sep=";",na.strings="?",header=TRUE)

##convert Date column to be of the "Date" class, then subset the data we need(2007-02-01 to 2007-02-02) 
##from the raw data.
data$Date<-as.Date(data$Date,"%d/%m/%Y")
mydata<-data[data$Date=="2007-02-01"|data$Date=="2007-02-02",]

##combine the "Date" column with the "Time" column, then use fucntion "strptime()" to get the the time data 
##in "POSIXlt" format
vectime<-with(mydata,data.frame(
        Time=as.character(paste(Date,Time))))
convertedTime<-strptime(vectime$Time,"%Y-%m-%d %H:%M:%S")
mydata$Time<-convertedTime

##Open a png graphical device to make the plot
png("Plot4.png",width = 480, height = 480, units = "px")


##To combine four charts, change the global parameter to be a 2 by 2 matrix of plots, then add plots one by one
##

##make a 2 by 2 matrix of plots by change the mfrow parameter of global setting
par(mfrow=c(2,2))

##first chart, demonstrate Global Active Power over time
plot(mydata$Time,mydata$Global_active_power,type="l",xlab="",ylab="Global Active Power")

##second chart, demonstrate Voltage over time
plot(mydata$Time,mydata$Voltage,type="l",xlab="datetime",ylab="Voltage")

##third chart, demonstrate Energy sub metering over time
plot(mydata$Time,mydata$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")

lines(mydata$Time,mydata$Sub_metering_2,type="l",col="red")

lines(mydata$Time,mydata$Sub_metering_3,type="l",col="blue")

legend("topright",lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),bty="n")

##fourth chart, demonstrate Global reactive power over time
plot(mydata$Time,mydata$Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power")

##close the png device
dev.off()