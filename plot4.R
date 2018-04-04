########################### READ AND GET THE DATA ###########################

# READ THE DATA
dataFile <- "household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

# SUBSET THE DATE THAT WE STUDY
data <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

########################### PLOT 4 : MULTIGRAPH ###########################

#GETTING THE DATA TO PLOT
datetime <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
globalActivePower <- as.numeric(data$Global_active_power)
voltage <- as.numeric(data$Voltage)

#OPENING A PNG DEVICE
png("plot4.png", width = 480, height = 480)

#CREATE A 2 BY 2 GRAPH MATRIX
par(mfcol= c(2,2))

#DRAWING THE GRAPH

#FIRST GRAPH
plot(datetime, globalActivePower, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")

#SECOND GRAPH
plot(datetime, data$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(datetime, data$Sub_metering_2, type = "l", col = "red")
lines(datetime, data$Sub_metering_3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1, lwd = 1)

#THIRD GRAPH
plot(datetime, voltage, type = "l")


#FOURTH GRAPH
plot(datetime, data$Global_reactive_power, type = "l")

#CLOSING THE DEVICE
dev.off()