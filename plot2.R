# Generate plot 2

path <- "./data/household_power_consumption.txt"
data <- read.table(path, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
datasub <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

datetime <- strptime(paste(datasub$Date, datasub$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
activepower <- as.numeric(datasub$Global_active_power)
png("plot2.png", width=480, height=480)
plot(datetime, globalactivepower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()

