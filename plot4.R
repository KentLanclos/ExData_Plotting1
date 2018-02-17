#Generate plot 4

path <- "./data/household_power_consumption.txt"
data <- read.table(path, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
datasub <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

datetime <- strptime(paste(datasub$Date, datasub$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
activepower <- as.numeric(datasub$Global_active_power)
reactivepower <- as.numeric(datasub$Global_reactive_power)
voltage <- as.numeric(datasub$Voltage)
metering1 <- as.numeric(datasub$Sub_metering_1)
metering2 <- as.numeric(datasub$Sub_metering_2)
metering3 <- as.numeric(datasub$Sub_metering_3)


png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

plot(datetime, activepower, type="l", xlab="", ylab="Global Active Power", cex=0.2)
plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")
plot(datetime, metering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, metering2, type="l", col="red")
lines(datetime, metering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(datetime, reactivepower, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()
