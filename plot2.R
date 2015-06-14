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
png("plot2.png", width=480, height=480)
plot(globalActivePower,type= "l",xaxt="n", ylab = "Global Active Power (kilowatts)")
axis(side=1, labels=c("Thursday", "Friday", "Saturday"), at =c(1,1440,2879))
dev.off()


