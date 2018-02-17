#Generate plot 3

path <- "./data/household_power_consumption.txt"
data <- read.table(path, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
datasub <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

datetime <- strptime(paste(datasub$Date, datasub$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
metering1 <- as.numeric(datasub$Sub_metering_1)
metering2 <- as.numeric(datasub$Sub_metering_2)
metering3 <- as.numeric(datasub$Sub_metering_3)

png("plot3.png", width=480, height=480)
plot(datetime, metering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, metering2, type="l", col="red")
lines(datetime, metering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()
