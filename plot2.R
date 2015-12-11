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

# Create plot 2
png(filename="plot2.png", width=480, height=480)
par(mfrow=c(1,1))
with(data, plot(Time, Global_active_power, xlab="", ylab="Global Active Power (kilowatts)", type="l"))
dev.off()
