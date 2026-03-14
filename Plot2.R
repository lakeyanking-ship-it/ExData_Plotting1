## plot2.R

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

png("plot2.png", width = 480, height = 480)

plot(
  power_subset$DateTime,
  power_subset$Global_active_power,
  type = "l",
  xlab = "",
  ylab = "Global Active Power (kilowatts)"
)

dev.off()
