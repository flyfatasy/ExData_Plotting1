data<-read.table("household_power_consumption.txt", header=T, sep=";", stringsAsFactors=F, na.strings="?")
data1<-subset(data, Date %in% c("1/2/2007", "2/2/2007"))
time<-strptime(paste(data1$Date, data1$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
png("plot3.png", width=480, height=480)
globalActivePower <- as.numeric(data1$Global_active_power)
globalReactivePower <- as.numeric(data1$Global_reactive_power)
voltage <- as.numeric(data1$Voltage)
subMetering1 <- as.numeric(data1$Sub_metering_1)
subMetering2 <- as.numeric(data1$Sub_metering_2)
subMetering3 <- as.numeric(data1$Sub_metering_3)


png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

plot(time, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(time, voltage, type="l", xlab="time", ylab="Voltage")

plot(time, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(time, subMetering2, type="l", col="red")
lines(time, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(time, globalReactivePower, type="l", xlab="time", ylab="Global_reactive_power")

dev.off()
