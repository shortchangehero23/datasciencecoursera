powerConsumptionData <- read.table('household_power_consumption.txt', sep = ';', header = TRUE, na.strings = '?')


targetData <- subset(powerConsumptionData, Date == '1/2/2007' | Date == '2/2/2007')

targetData$Timestamp = strptime(paste(targetData$Date, targetData$Time), format = '%d/%m/%Y %H:%M:%S')

# Plot 4
png('plot4.png', width = 480, height = 480)

par(mfrow = c(2,2))

with(targetData, plot(Timestamp, Global_active_power, type = 'l', ylab = 'Global Active Power', xlab = ''))

with(targetData, plot(Timestamp, Voltage, type = 'l', xlab = 'datetime'))

with(targetData, plot(Timestamp, Sub_metering_1, type = 'l', ylab = 'Energy sub metering'))
with(targetData, lines(Timestamp, Sub_metering_2, col = "red"))
with(targetData, lines(Timestamp, Sub_metering_3, col = "blue"))
legend('topright', legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), col=c('black', 'red', 'blue'), lty = 1, bty='n')

with(targetData, plot(Timestamp, Global_reactive_power, type = 'l', xlab = 'datetime'))

dev.off()
