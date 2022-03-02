dataSet <- "./household_power_consumption.txt"
data <- read.table(dataSet, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
dataSubSet <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

datetime <- strptime(paste(dataSubSet$Date, dataSubSet$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(dataSubSet$Global_active_power)
globalReactivePower <- as.numeric(dataSubSet$Global_reactive_power)
voltage <- as.numeric(dataSubSet$Voltage)
subMetering_1 <- as.numeric(dataSubSet$Sub_metering_1)
subMetering_2 <- as.numeric(dataSubSet$Sub_metering_2)
subMetering_3 <- as.numeric(dataSubSet$Sub_metering_3)


png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

plot(date_time, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(date_time, voltage, type="l", xlab="datetime", ylab="Voltage")

plot(date_time, subMetering_1, type="l", ylab="Energy Sub Metering", xlab="")
lines(date_time, subMetering_2, type="l", col="red")
lines(date_time, subMetering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(date_time, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()