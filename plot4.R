if (!file.exists("household_power_consumption.txt"))
{
  url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  download.file(url, destfile="household_power_consumption.zip")
  unzip("household_power_consumption.zip")
}

# Load data
data <- read.table("household_power_consumption.txt", na.strings = "?", sep=";", skip=66637, nrows=2880)
names(data) <- scan("household_power_consumption.txt", what="character", sep=";", nlines=1, quiet=TRUE)
data$Time <- strptime(paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S")
data$Date <- as.Date(strptime(data$Date, format = "%d/%m/%Y"))

# Create plot 4
png(filename="plot4.png", width=480, height=480)
par(mfrow=c(2,2))

with(data, plot(Time, Global_active_power, xlab="", ylab="Global Active Power", type="l"))

with(data, plot(Time, Voltage, type="l"))

with(data, plot(Time, Sub_metering_1, xlab="", ylab="Energy sub metering", type="l", col="black"))
with(data, lines(Time, Sub_metering_2, type="l", col="red"))
with(data, lines(Time, Sub_metering_3, type="l", col="blue"))
legend("topright", col=c("black", "red", "blue1"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, bty="n", cex=0.9)

with(data, plot(Time, Global_reactive_power, xlab="datetime", type="l"))

dev.off()