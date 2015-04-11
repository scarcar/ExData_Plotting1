#plot4.R
#x <- read.csv("household_power_consumption.txt", sep=";")
y1 <- x[x$Date=="1/2/2007",]
y2 <- x[x$Date=="2/2/2007",]
y3 <- rbind(y1,y2)
y4 <- y3

y4$DateTime<- paste(y4$Date, y4$Time, sep=" ")
y4$DateTime<- strptime(y4$DateTime, format="%d/%m/%Y %H:%M:%S")

y4$Global_active_power <- as.numeric(as.character(y4$Global_active_power))
y4$Global_reactive_power <- as.numeric(as.character(y4$Global_reactive_power))
y4$Sub_metering_1 <- as.numeric(as.character(y4$Sub_metering_1))
y4$Sub_metering_2 <- as.numeric(as.character(y4$Sub_metering_2))
y4$Sub_metering_3 <- as.numeric(as.character(y4$Sub_metering_3))
y4$Voltage <- as.numeric(as.character(y4$Voltage))

#hist(y4$Global_active_power, col="red", main="Global Active Power",
#     xlab="Global Active Power (kilowatts)")
par(mfrow=c(2,2))

plot(y4$DateTime, y4$Global_active_power, 
     ylab="Global Active Power", xlab="", type="l")
     
plot(y4$DateTime, y4$Voltage, 
     ylab="Voltage", xlab="datetime", type="l")    

plot(y4$DateTime, y4$Sub_metering_1,
     ylab="Energy sub metering", xlab="", type="l", col="black")
lines(y4$DateTime, y4$Sub_metering_2, col="red")
lines(y4$DateTime, y4$Sub_metering_3, col="blue")

legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty=c(1,1,1),   # (lines)
       col=c("black", "red", "blue"),
       bty="n", cex=0.6)   #remove border from legend

plot(y4$DateTime, y4$Global_reactive_power, 
      ylab="Global_reactive_power", xlab="datetime", type="l")



dev.copy(png, file = "plot4.png")  ## copy plot to a PNG file
dev.off()   ## closing the PNG device