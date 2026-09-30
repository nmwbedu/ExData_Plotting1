#plot2

# Download the data and unzip it
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile = "power_consumption.zip")
unzip("power_consumption.zip")

# Read the data and add a datetime variable
DF <- read.table(file = "household_power_consumption.txt", sep = ";",header = TRUE, na.strings = "?",
                 colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))
DF <- DF[DF$Date %in% c("1/2/2007", "2/2/2007"),]
DF$datetime <- strptime(paste(DF$Date, DF$Time), "%d/%m/%Y %H:%M:%S")

# Create the plot as png and save it
png(filename = "plot2.png")
plot(DF$datetime, DF$Global_active_power, type = "l", lty=1, xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
