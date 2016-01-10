# Exploratory Data Analysis
# Assignment: Project 1
# Plot 4 - Global Active Power (4 charts)

# Read raw data and extract data for the days of interest
sourceData <- "household_power_consumption.txt"
rawData <- read.table(sourceData, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
daysData <- rawData[rawData$Date %in% c("1/2/2007", "2/2/2007") ,]

# Massage data fields
parseDate <- strptime(paste(daysData$Date, daysData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
globalActivePower <- as.numeric(daysData$Global_active_power)
subMetering1 <- as.numeric(daysData$Sub_metering_1)
subMetering2 <- as.numeric(daysData$Sub_metering_2)
subMetering3 <- as.numeric(daysData$Sub_metering_3)
globalReactivePower <- as.numeric(daysData$Global_reactive_power)
voltage <- as.numeric(daysData$Voltage)

# Plot graphs
png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

# Plot 1
plot(parseDate, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)

# Plot 2
plot(parseDate, voltage, type="l", xlab="datetime", ylab="Voltage")

# Plot 3
plot(parseDate, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(parseDate, subMetering2, type="l", col="red")
lines(parseDate, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

# Plot 4
plot(parseDate, globalReactivePower, type="l", xlab="Date/Time", ylab="Global Reactive Power")

dev.off()

