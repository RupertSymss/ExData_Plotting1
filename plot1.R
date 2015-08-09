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
# Create the histogram on the window
hist(Global_Active_Power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")
# copy to png
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
