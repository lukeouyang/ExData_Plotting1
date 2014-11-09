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

##Open a png graphical device and make the plot
png("Plot2.png")
plot(mydata$Time,mydata$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")
dev.off()