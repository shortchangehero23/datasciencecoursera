powerConsumptionData <- read.table('household_power_consumption.txt', sep = ';', header = TRUE, na.strings = '?')


targetData <- subset(powerConsumptionData, Date == '1/2/2007' | Date == '2/2/2007')

targetData$Timestamp = strptime(paste(targetData$Date, targetData$Time), format = '%d/%m/%Y %H:%M:%S')

# Plot 1
png('plot1.png', width = 480, height = 480)

hist(targetData$Global_active_power, breaks = 12, main = 'Global Active Power', xlab = 'Global Active Power (kilowatts)', col = 'red')

dev.off()