powerConsumptionData <- read.table('household_power_consumption.txt', sep = ';', header = TRUE, na.strings = '?')


targetData <- subset(powerConsumptionData, Date == '1/2/2007' | Date == '2/2/2007')

targetData$Timestamp = strptime(paste(targetData$Date, targetData$Time), format = '%d/%m/%Y %H:%M:%S')

# Plot 2
png('plot2.png', width = 480, height = 480)

with(targetData, plot(Timestamp, Global_active_power, type = 'l', ylab = 'Global Active Power (kilowatts)', xlab = ''))
dev.off()