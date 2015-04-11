#plot2.R
x <- read.csv("household_power_consumption.txt", sep=";")
y1 <- x[x$Date=="1/2/2007",]
y2 <- x[x$Date=="2/2/2007",]
y3 <- rbind(y1,y2)
y4 <- y3

y4$DateTime<- paste(y4$Date, y4$Time, sep=" ")
y4$DateTime<- strptime(y4$DateTime, format="%d/%m/%Y %H:%M:%S")

y4$Global_active_power <- as.numeric(as.character(y4$Global_active_power))
#hist(y4$Global_active_power, col="red", main="Global Active Power",
#     xlab="Global Active Power (kilowatts)")

plot(y4$DateTime, y4$Global_active_power,
     ylab="Global Active Power (kilowatts)", xlab="", type="l")

dev.copy(png, file = "plot2.png", width=480, height=480)  ## copy plot to a PNG file
dev.off()   ## closing the PNG device