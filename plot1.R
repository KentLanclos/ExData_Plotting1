#Generate plot 1

path <- "./data/household_power_consumption.txt"
data <- read.table(path, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
datasub <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

activepower <- as.numeric(datasub$Global_active_power)
png("plot1.png", width=480, height=480)
hist(activepower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()