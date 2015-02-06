tmp <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", colClasses = c("character", "character", rep("numeric", 7)), na.strings = "?")
dat <- subset(tmp, Date %in% c("1/2/2007", "2/2/2007"))
dat$DateTime <- strptime(paste(dat$Date, dat$Time), format = "%d/%m/%Y %H:%M:%S")

png("plot3.png", width = 480, height = 480)
plot(dat$DateTime, dat$Sub_metering_1, main = "", xlab = "", ylab = "Energy sub metering",
     type = "l")
lines(dat$DateTime, dat$Sub_metering_2, col = "red")
lines(dat$DateTime, dat$Sub_metering_3, col = "blue")
legend("topright", legend = names(dat)[7:9], lty = 1, col = c("black", "red", "blue"))
dev.off()