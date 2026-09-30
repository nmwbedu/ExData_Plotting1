#plot1
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile = "power_consumption.zip")
unzip("power_consumption.zip")


DF <- read.table(file = "household_power_consumption.txt", sep = ";",header = TRUE)
DF <- DF[DF$Date %in% c("1/2/2007", "2/2/2007"),]
DF$datetime <- strptime(paste(DF$Date, DF$Time), "%d/%m/%Y %H:%M:%S")
DF$Global_active_power <- as.numeric(DF$Global_active_power)

png(filename = "plot1.png")
hist(DF$Global_active_power, col="red", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", main = "Global Active Power")
dev.off()
