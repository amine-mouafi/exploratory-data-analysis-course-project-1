# Data preparation
data <- read.csv("household_power_consumption.txt", sep=";", 
                 na.strings = "?", stringsAsFactors=FALSE)
data <- na.omit(data)
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
subset <- subset(data, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))
subset$DateTime <- paste(subset$Date,subset$Time)
subset$DateTime <- as.POSIXct(subset$DateTime)

# Plot 4
par(mfrow=c(2,2))

# P1
plot(subset$DateTime, subset$Global_active_power,
     type = "l",
     xlab = "",
     ylab = "Global Active Power (kilowatts)")

# P2
plot(subset$DateTime, subset$Voltage,
     type="l", 
     xlab="datetime", 
     ylab="Voltage")

# P3
plot(subset$DateTime, subset$Sub_metering_1,
     type = "l",
     xlab = "",
     ylab = "Energy sub metering")

lines(subset$DateTime, subset$Sub_metering_2, col = "red")
lines(subset$DateTime, subset$Sub_metering_3, col = "blue")

legend("topright", col = c("black","red","blue"), 
       c("Sub_metering_1 ", "Sub_metering_2", "Sub_metering_3"),
       lty = c(1,1), lwd = c(1,1), 
       bty = "n", cex = 0.6)

# P4
plot(subset$DateTime, subset$Global_reactive_power, 
     type="l", 
     xlab="datetime", 
     ylab="Global_reactive_power")


dev.copy(png, file = "Plot4.png", width = 480, height = 480)
dev.off()
