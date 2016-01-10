# Exploratory Data Analysis
# Assignment: Project 1
# Plot 3 - Global Active Power sub metering

# Read raw data and extract data for the days of interest
sourceData <- "household_power_consumption.txt"
rawData <- read.table(sourceData, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
daysData <- rawData[rawData$Date %in% c("1/2/2007", "2/2/2007") ,]

# Massage date field and power fields
parseDate <- strptime(paste(daysData$Date, daysData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
globalActivePower <- as.numeric(daysData$Global_active_power)
subMetering1 <- as.numeric(daysData$Sub_metering_1)
subMetering2 <- as.numeric(daysData$Sub_metering_2)
subMetering3 <- as.numeric(daysData$Sub_metering_3)

# Plot graphs
png("plot3.png", width=480, height=480)
plot(parseDate, subMetering1, type="l", ylab="Energy sub metering", xlab="")
lines(parseDate, subMetering2, type="l", col="red")
lines(parseDate, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()
