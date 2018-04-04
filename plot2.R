########################### READ AND GET THE DATA ###########################

# READ THE DATA
dataFile <- "household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

# SUBSET THE DATE THAT WE STUDY
data <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

########################### PLOT 2 : GLOBAL ACTIVE POWER BY DATE AND TIME ###########################

#GETTING THE DATA TO PLOT
datetime <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
globalActivePower <- as.numeric(data$Global_active_power)

#OPENING AN PNG DEVICE
png("plot2.png", width = 480, height = 480)
plot(datetime, globalActivePower, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")

#CLOSING THE DEVICE
dev.off()