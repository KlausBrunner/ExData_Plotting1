# Exploratory Data Analysis, PA1 part 4

library(lubridate)
data <- (function() {
    # Reads data for the assignment. This is not parameterized as it's not expected to be
    # reused.  Returns: Data frame
    
    data <- read.csv("household_power_consumption.txt", sep = ";", na.strings = "?")
    
    # create a nice datetime column
    data$datetime <- dmy_hms(paste(data$Date, data$Time))
    
    # filter out rows we don't need, using explicit conversion to ensure same timezone
    data <- subset(data, datetime >= ymd("2007-02-01") & datetime < ymd("2007-02-03"))
})()

# plot to PNG device
png(filename = "plot4.png")

# 2-by-2 grid
par(mfrow = c(2, 2))

# plot 2 (without unit for power)
with(data, plot(datetime, Global_active_power, type = "n", ylab = "Global Active Power", xlab = ""))
with(data, lines(datetime, Global_active_power))

# new plot: voltage over time
with(data, plot(datetime, Voltage, type = "n"))
with(data, lines(datetime, Voltage))

# plot 3 (without legend box)
with(data, plot(datetime, Sub_metering_1, type = "n", ylab = "Energy sub metering", xlab = ""))

plotcols <- c("black", "red", "blue")
plotlines <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

for (i in 1:length(plotcols)) {
    lines(data$datetime, data[, plotlines[i]], col = plotcols[i])
}

legend("topright", plotlines, lty = c(1, 1), bty = "n", col = plotcols)

# new plot: global reactive power over time
with(data, plot(datetime, Global_reactive_power, type = "n"))
with(data, lines(datetime, Global_reactive_power))

dev.off() 
