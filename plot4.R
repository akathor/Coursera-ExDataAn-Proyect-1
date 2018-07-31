# Reading Data
library(lubridate)
rawData <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
rawData$Date <- dmy(rawData$Date)
rawData$Time <- (hms(rawData$Time))
data <- subset(rawData, Date >= "2007-02-01" & Date <= "2007-02-02")
data$datetime <- data$Date + data$Time
rm(rawData)

# Plot 4
png("plot4.png", width = 480, height = 480)
par(mfrow = c(2,2))
plot(data$datetime, data$Global_active_power, type = "l", ylab = "Global Active Power", xlab = "")
plot(data$datetime, data$Voltage, type = "l", ylab = "Voltage", xlab = "datetime")
with(data, {
  plot(datetime, Sub_metering_1, type = "n", main = "", ylab = "Energy sub metering", xlab = "" )
  lines(datetime, Sub_metering_1, type = "l", col = "black")
  lines(datetime, Sub_metering_2, type = "l", col = "red")
  lines(datetime, Sub_metering_3, type = "l", col = "blue")
})
legend("topright", c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1, bty = "n", text.font = "")
plot(data$datetime, data$Global_reactive_power, type = "l", ylab = "Global_reactive_power", xlab = "datetime")
dev.off()
