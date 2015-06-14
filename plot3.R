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
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(subSetData$Global_active_power)
subMetering1 <- as.numeric(subSetData$Sub_metering_1)
subMetering2 <- as.numeric(subSetData$Sub_metering_2)
subMetering3 <- as.numeric(subSetData$Sub_metering_3)

png("plot3.png", width=480, height=480)
plot(factor(datetime), subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()

