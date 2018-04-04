########################### READ AND GET THE DATA ###########################

# READ THE DATA
dataFile <- "household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

# SUBSET THE DATE THAT WE STUDY
data <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

########################### PLOT 3 : ENERGY SUB METERING BY DATE AND TIME ###########################

#GETTING THE DATA TO PLOT
datetime <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

#OPENING A PNG DEVICE
png("plot3.png", width = 480, height = 480)

#DRAWING THE GRAPH
plot(datetime, data$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(datetime, data$Sub_metering_2, type = "l", col = "red")
lines(datetime, data$Sub_metering_3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1, lwd = 1)

#CLOSING THE DEVICE
dev.off()