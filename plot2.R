
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
reducedpowerdata$Global_active_power <- as.numeric(trimws(reducedpowerdata$Global_active_power))

#plot graph
png(filename="plot2.png")
plot(reducedpowerdata$DateTime, reducedpowerdata$Global_active_power, type="l",
     ylab = "Global Active Power (kilowatts)", xlab = "")
dev.off()

