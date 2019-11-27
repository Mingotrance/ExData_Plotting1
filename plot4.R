

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
reducedpowerdata$Voltage <- as.numeric(trimws(reducedpowerdata$Voltage))
reducedpowerdata$Global_active_power <- as.numeric(trimws(reducedpowerdata$Global_active_power))
reducedpowerdata$Global_reactive_power <- as.numeric(trimws(reducedpowerdata$Global_reactive_power))


#plot all four graphs
png(filename="plot4.png")
par(mfrow=c(2,2))
plot(reducedpowerdata$DateTime, reducedpowerdata$Global_active_power, type="l",
     ylab = "Global Active Power", xlab = "")

plot(reducedpowerdata$DateTime, reducedpowerdata$Voltage, type="l",
     ylab = "Voltage", xlab = "datetime")

plot(reducedpowerdata$DateTime, reducedpowerdata$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "")
lines(reducedpowerdata$DateTime, reducedpowerdata$Sub_metering_2, col = "red")
lines(reducedpowerdata$DateTime, reducedpowerdata$Sub_metering_3, col = "blue")
legend(x="topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col=c("black", "red", "blue"), lty=1, bty = "n")

plot(reducedpowerdata$DateTime, reducedpowerdata$Global_reactive_power, type="l",
     ylab = "Global_reactive_power", xlab = "datetime")

dev.off()