# Reading Data
library(lubridate)
rawData <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
rawData$Date <- dmy(rawData$Date)
rawData$Time <- (hms(rawData$Time))
data <- subset(rawData, Date >= "2007-02-01" & Date <= "2007-02-02")
data$datetime <- data$Date + data$Time
rm(rawData)


#Plot 2
png("plot2.png", width = 480, height = 480)
plot(data$datetime, data$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
dev.off()