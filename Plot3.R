# Data preparation
data <- read.csv("household_power_consumption.txt", sep=";", 
                 na.strings = "?", stringsAsFactors=FALSE)
data <- na.omit(data)
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
subset <- subset(data, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))
subset$DateTime <- paste(subset$Date,subset$Time)
subset$DateTime <- as.POSIXct(subset$DateTime)

# Plot 3
par(mfrow=c(1,1))

plot(subset$DateTime, subset$Sub_metering_1,
     type = "l",
     xlab = "",
     ylab = "Energy sub metering")

lines(subset$DateTime, subset$Sub_metering_2, col = "red")
lines(subset$DateTime, subset$Sub_metering_3, col = "blue")

legend("topright", col = c("black","red","blue"), 
       c("Sub_metering_1 ", "Sub_metering_2", "Sub_metering_3"),
       lty = c(1,1), lwd = c(1,1), cex = 0.9)


dev.copy(png, file = "Plot3.png", width = 480, height = 480)
dev.off()
