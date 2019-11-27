
#read dataset
powerdata <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
powerdata$Date <- as.Date(powerdata$Date, format = "%d/%m/%Y")

#Just keep 1st and 2nd Feb 2007
startDate = as.Date("2007-02-01");
endDate = as.Date("2007-02-02");
reducedpowerdata <- powerdata[powerdata$Date >= startDate & powerdata$Date <= endDate,]

#combine date and time in a new column
reducedpowerdata$DateTime <- as.POSIXct(paste(reducedpowerdata$Date, reducedpowerdata$Time), format="%Y-%m-%d %H:%M:%S")

#coerce factor variables as numeric
reducedpowerdata$Sub_metering_1 <- as.numeric(trimws(reducedpowerdata$Sub_metering_1))
reducedpowerdata$Sub_metering_2 <- as.numeric(trimws(reducedpowerdata$Sub_metering_2))
reducedpowerdata$Sub_metering_3 <- as.numeric(trimws(reducedpowerdata$Sub_metering_3))

#plot graph
png(filename="plot3.png")
plot(reducedpowerdata$DateTime, reducedpowerdata$Sub_metering_1, type = "l",ylab = "Energy sub metering", xlab = "")
lines(reducedpowerdata$DateTime, reducedpowerdata$Sub_metering_2, col = "red")
lines(reducedpowerdata$DateTime, reducedpowerdata$Sub_metering_3, col = "blue")
legend(x="topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty=1)
dev.off()