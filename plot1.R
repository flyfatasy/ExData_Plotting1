data<-read.table("household_power_consumption.txt", header=T, sep=";", stringsAsFactors=F, na.strings="?")
data1<-subset(data, Date %in% c("1/2/2007", "2/2/2007"))
data2<-as.numeric(data1$Global_active_power)
png("plot1.png", width=480, height=480)
hist(data2, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
