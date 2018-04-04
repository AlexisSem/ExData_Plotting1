########################### READ AND GET THE DATA ###########################

# READ THE DATA
dataFile <- "household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

# WE CONVERT THE DATE COLUMN INTO A REAL DATE FORMAT
data$Date <- as.Date(data$Date, "%d/%m/%Y")

# SUBSET THE DATE THAT WE STUDY
beginDate <- as.Date("01/02/2007", "%d/%m/%Y")
endDate <- as.Date("02/02/2007", "%d/%m/%Y")
data <- subset(data, (data$Date >= beginDate & data$Date <= endDate))

########################### PLOT 1 : GLOBAL ACTIVE POWER ###########################

#GETTING THE DATA TO PLOT
globalActivePower <- as.numeric(data$Global_active_power)

#OPENING AN PNG DEVICE
png("plot1.png", width = 480, height = 480)
hist(globalActivePower, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

#CLOSING THE DEVICE
dev.off()