# Exploratory Data Analysis, PA1 part 2

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
png(filename = "plot2.png")
with(data, plot(datetime, Global_active_power, type = "n", ylab = "Global Active Power (kilowatts)", 
    xlab = ""))
with(data, lines(datetime, Global_active_power))
dev.off() 
