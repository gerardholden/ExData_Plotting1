# Exploratory Data Analysis
# Assignment: Project 1
# Plot 1 - Global Active Power

sourceData <- "household_power_consumption.txt"

rawData <- read.table(sourceData, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

# print(head(rawData))

daysData <- rawData[rawData$Date %in% c("1/2/2007", "2/2/2007") ,]

globalActivePower = as.numeric(daysData$Global_active_power)
png("plot1.png", width=480, height=480)
hist(globalActivePower, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")
dev.off
