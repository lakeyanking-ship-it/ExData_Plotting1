## plot1.R

## Read and prepare data
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

## Open PNG device
png("plot1.png", width = 480, height = 480)

## Create histogram
hist(
  power_subset$Global_active_power,
  col = "red",
  main = "Global Active Power",
  xlab = "Global Active Power (kilowatts)"
)

## Close device
dev.off()
