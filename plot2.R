tmp <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", colClasses = c("character", "character", rep("numeric", 7)), na.strings = "?")
dat <- subset(tmp, Date %in% c("1/2/2007", "2/2/2007"))
dat$DateTime <- strptime(paste(dat$Date, dat$Time), format = "%d/%m/%Y %H:%M:%S")

png("plot2.png", width = 480, height = 480)
plot(dat$DateTime, dat$Global_active_power, main = "", xlab = "", ylab = "Global Active Power (kilowatts)",
     type = "l")
dev.off()