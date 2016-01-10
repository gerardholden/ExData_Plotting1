# Exploratory Data Analysis
# Assignment: Project 1
# Plot 2 - Global Active Power by date

# Read raw data and extract data for the days of interest
sourceData <- "household_power_consumption.txt"
rawData <- read.table(sourceData, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
daysData <- rawData[rawData$Date %in% c("1/2/2007", "2/2/2007") ,]

# Massage date field and power field
parseDate <- strptime(paste(daysData$Date, daysData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
globalActivePower <- as.numeric(daysData$Global_active_power)

# Plot graphs
png("plot2.png", width=480, height=480)
plot(parseDate, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
