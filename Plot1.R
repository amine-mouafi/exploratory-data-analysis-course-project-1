# Data preparation
data <- read.csv("household_power_consumption.txt", sep=";", 
                 na.strings = "?", stringsAsFactors=FALSE)
data <- na.omit(data)
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
subset <- subset(data, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))
subset$DateTime <- paste(subset$Date,subset$Time)
subset$DateTime <- as.POSIXct(subset$DateTime)

# Plot 1
hist(subset$Global_active_power,  
     main = "Global Active Power", 
     col = "red", xlab = "Global Active Power (kilowatts)")

dev.copy(png, file = "Plot1.png", width = 480, height = 480)
dev.off()
