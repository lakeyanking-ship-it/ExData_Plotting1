## plot4.R

data_file <- "household_power_consumption.txt"

power <- read.table(
  data_file,
  header = TRUE,
  sep = ";",
  na.strings = "?",
  stringsAsFactors = FALSE
)

power_subset <- subset(
  power,
  Date == "1/2/2007" | Date == "2/2/2007"
)

power_subset$DateTime <- strptime(
  paste(power_subset$Date, power_subset$Time),
  format = "%d/%m/%Y %H:%M:%S"
)

png("plot4.png", width = 480, height = 480)

par(mfrow = c(2, 2))

## Top-left
plot(
  power_subset$DateTime,
  power_subset$Global_active_power,
  type = "l",
  xlab = "",
  ylab = "Global Active Power"
)

## Top-right
plot(
  power_subset$DateTime,
  power_subset$Voltage,
  type = "l",
  xlab = "datetime",
  ylab = "Voltage"
)

## Bottom-left
plot(
  power_subset$DateTime,
  power_subset$Sub_metering_1,
  type = "l",
  xlab = "",
  ylab = "Energy sub metering"
)

lines(power_subset$DateTime, power_subset$Sub_metering_2, col = "red")
lines(power_subset$DateTime, power_subset$Sub_metering_3, col = "blue")

legend(
  "topright",
  legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
  col = c("black", "red", "blue"),
  lty = 1,
  bty = "n"
)

## Bottom-right
plot(
  power_subset$DateTime,
  power_subset$Global_reactive_power,
  type = "l",
  xlab = "datetime",
  ylab = "Global Reactive Power"
)

dev.off()
