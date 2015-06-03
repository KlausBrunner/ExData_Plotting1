# Exploratory Data Analysis, PA1 part 1

library(lubridate)
data <- (function() {
    # Reads data for the assignment. This is not parameterized as it's not expected to be reused.
    # Returns:
    #   Data frame
    
    data <- read.csv("household_power_consumption.txt", 
                     sep=";", 
                     na.strings="?")
    
    # create a nice datetime column
    data$datetime <- dmy_hms(paste(data$Date, data$Time))
    
    # filter out rows we don't need, using explicit conversion to ensure same timezone
    data <- subset(data, datetime >= ymd("2007-02-01") & datetime < ymd("2007-02-03"))
})()

# plot to PNG device
png(filename = "plot1.png")
hist(data$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()
