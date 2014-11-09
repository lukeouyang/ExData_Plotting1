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
png("Plot2.png")

##plot graphical elemnets one by one: a black line represent sub_metering_1, a red line represent sub_metering_2,
##a blue line represent sub_metering_3 and a legend at last
plot(mydata$Time,mydata$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")

lines(mydata$Time,mydata$Sub_metering_2,type="l",col="red")

lines(mydata$Time,mydata$Sub_metering_3,type="l",col="blue")

legend("topright",lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

##close the png device
dev.off()