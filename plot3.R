# Read the Data
hpc <- read.table("household_power_consumption.txt", header=TRUE, sep=";", dec=".", na.strings = "?", stringsAsFactors=FALSE )
# Fix the Date Format
hpc$Date <- as.Date(hpc$Date, format="%d/%m/%Y")
hpc1 <- hpc[hpc$Date %in% as.Date(c("2007/02/01","2007/02/02")) ,]
# Clear the Memory
rm ("hpc")
# Prepare the final dataset
Global_Active_Power <- as.numeric(hpc1$Global_active_power)
dt1 <- paste(hpc1$Date, hpc1$Time, sep=" ") 
dt2 <- as.POSIXlt(dt1) 
sm1 <- as.numeric(hpc1$Sub_metering_1)
sm2 <- as.numeric(hpc1$Sub_metering_2)
sm3 <- as.numeric(hpc1$Sub_metering_3)
# Create the plot on the window
plot(dt2, sm1, type="l", ylab="Energy sub metering", xlab="")
par(mar=c(3,3,1,1))
lines(dt2, sm2, type="l", col="green")
lines(dt2, sm3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=3, col=c("red", "green", "blue"))
# copy to png
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()
