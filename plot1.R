#plot1.R
library(chron)
x <- read.csv("household_power_consumption.txt", sep=";")
y1 <- x[x$Date=="1/2/2007",]
y2 <- x[x$Date=="2/2/2007",]
y3 <- rbind(y1,y2)
y4 <- y3
y4$Date <- as.Date(y4$Date, format="%d/%m/%Y")
y4$Time <- chron(times=y4$Time)
y4$Global_active_power <- as.numeric(as.character(y4$Global_active_power))
hist(y4$Global_active_power, col="red", main="Global Active Power",
     xlab="Global Active Power (kilowatts)")
dev.copy(png, file = "plot1.png", width=480, height=480)  ## copy plot to a PNG file
dev.off()   ## closing the PNG device