hpc<-read.csv2("household_power_consumption.txt")
hpc["Date2"] <- as.Date(hpc$Date,"%d/%m/%Y")
hpc.sub <- subset(hpc,Date2==as.Date("2007-02-01","%Y-%m-%d")|(Date2==as.Date("2007-02-02","%Y-%m-%d")))
png(file="Plot4.png",width=480,height=480)
par(mfrow=c(2,2))
#Graph 1
plot(strptime(paste(hpc.sub$Date, hpc.sub$Time), "%d/%m/%Y %H:%M:%S"),as.numeric(as.character(hpc.sub$Global_active_power)),type = "l",ylab = "Global Active Power",xlab = "")
#Graph 2
plot(strptime(paste(hpc.sub$Date, hpc.sub$Time), "%d/%m/%Y %H:%M:%S"),as.numeric(as.character(hpc.sub$Voltage)),type = "l",ylab = "Voltage",xlab = "datetime")
#Graph 3
plot(strptime(paste(hpc.sub$Date, hpc.sub$Time), "%d/%m/%Y %H:%M:%S"),as.numeric(as.character(hpc.sub$Sub_metering_1)),type = "n",ylab = "Energy sub metering",xlab = "")
lines(strptime(paste(hpc.sub$Date, hpc.sub$Time), "%d/%m/%Y %H:%M:%S"),as.numeric(as.character(hpc.sub$Sub_metering_1)),type = "l")
lines(strptime(paste(hpc.sub$Date, hpc.sub$Time), "%d/%m/%Y %H:%M:%S"),as.numeric(as.character(hpc.sub$Sub_metering_2)),type = "l",col="red")
lines(strptime(paste(hpc.sub$Date, hpc.sub$Time), "%d/%m/%Y %H:%M:%S"),as.numeric(as.character(hpc.sub$Sub_metering_3)),type = "l",col="blue")
legend("topright",bty = "n", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty = c(1, 1, 1), lwd = c(2, 2, 2), col = c("black","red","blue"))
#Graph 4
plot(strptime(paste(hpc.sub$Date, hpc.sub$Time), "%d/%m/%Y %H:%M:%S"),as.numeric(as.character(hpc.sub$Global_reactive_power)),type = "l",ylab = "Global_reactive_power",xlab = "datetime")
dev.off()