##convert the Date and Time variables to Date/Time classes in R
dataFile <- "/Work/Explanaotry data analysis/Project1/household_power_consumption.txt"
fulldata <- read.table(dataFile, header=T, sep=';', na.strings="?",nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
fulldata$Date <- as.Date(fulldata$Date, format="%d/%m/%Y")
fulldata$Time <- format(fulldata$Time, format="%H:%M:%S")
##subsetting the data
subSetData1 <- fulldata[which(fulldata$Date =="2007-02-01"),]
subSetData2 <- fulldata[which(fulldata$Date =="2007-02-02"),]
subSetData <- rbind(subSetData1, subSetData2)

##string(subSetData)
datetime <- paste(subSetData$Date,subSetData$Time)
Datetime <- as.POSIXlt (strptime(datetime, "%Y-%m-%d %H:%M:%S")) 
globalActivePower <- as.numeric(subSetData$Global_active_power)
globalReactivePower <- as.numeric(subSetData$Global_reactive_power)
voltage <- as.numeric(subSetData$Voltage)
subMetering1 <- as.numeric(subSetData$Sub_metering_1)
subMetering2 <- as.numeric(subSetData$Sub_metering_2)
subMetering3 <- as.numeric(subSetData$Sub_metering_3)


png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

plot(Datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(Datetime, voltage, type="l", xlab="datetime", ylab="Voltage")

plot(Datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(Datetime, subMetering2, type="l", col="red")
lines(Datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(Datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()


