#plot3.R
x <- read.csv("household_power_consumption.txt", sep=";")
y1 <- x[x$Date=="1/2/2007",]
y2 <- x[x$Date=="2/2/2007",]
y3 <- rbind(y1,y2)
y4 <- y3

y4$DateTime<- paste(y4$Date, y4$Time, sep=" ")
y4$DateTime<- strptime(y4$DateTime, format="%d/%m/%Y %H:%M:%S")

y4$Global_active_power <- as.numeric(as.character(y4$Global_active_power))
y4$Sub_metering_1 <- as.numeric(as.character(y4$Sub_metering_1))
y4$Sub_metering_2 <- as.numeric(as.character(y4$Sub_metering_2))
y4$Sub_metering_3 <- as.numeric(as.character(y4$Sub_metering_3))

#hist(y4$Global_active_power, col="red", main="Global Active Power",
#     xlab="Global Active Power (kilowatts)")

plot(y4$DateTime, y4$Sub_metering_1,
     ylab="Energy sub metering", xlab="", type="l", col="black")
lines(y4$DateTime, y4$Sub_metering_2, col="red")
lines(y4$DateTime, y4$Sub_metering_3, col="blue")

legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty=c(1,1,1),   # (lines)
       col=c("black", "red", "blue"))

dev.copy(png, file = "plot3.png", width=480, height=480)  ## copy plot to a PNG file
dev.off()   ## closing the PNG device