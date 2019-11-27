
#read dataset
powerdata <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
powerdata$Date <- as.Date(powerdata$Date, format = "%d/%m/%Y")

#Just keep 1st and 2nd Feb 2007
startDate = as.Date("2007-02-01");
endDate = as.Date("2007-02-02");
reducedpowerdata <- powerdata[powerdata$Date >= startDate & powerdata$Date <= endDate,]

#coerce factor variables as numeric
reducedpowerdata$Global_active_power <- as.numeric(trimws(reducedpowerdata$Global_active_power))

#plot graph
png(filename="plot1.png")
hist(reducedpowerdata$Global_active_power, freq=TRUE, col="red",
     main="Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()