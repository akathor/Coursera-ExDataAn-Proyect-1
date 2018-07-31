
# Reading Data
library(lubridate)
rawData <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
rawData$Date <- dmy(rawData$Date)
rawData$Time <- (hms(rawData$Time))
data <- subset(rawData, Date >= "2007-02-01" & Date <= "2007-02-02")
rm(rawData)

#Plot 1
png("plot1.png", width = 480, height = 480)
hist(data$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()
