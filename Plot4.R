# loading data into R
data <- read.table("household_power_consumption.txt", 
                   sep = ';', 
                   header = TRUE, 
                   na.string = '?')


# time & date formatting & subsetting the required dates
data$Datetime <- strptime(paste(data$Date, data$Time, " "), format = "%d/%m/%Y %H:%M:%S")
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data_subset <- data[data$Date <= "2007-02-02" & data$Date >= "2007-02-01",]


# create a png file
png(filename="plot4.png", width = 480, height = 480, bg = "transparent")
par(mfrow = c(2, 2))


# plot graph 1
plot(data_subset$Datetime, data_subset$Global_active_power,
     type = "l",
     xlab = "",
     ylab = "Global Active Power")

# plot graph 2
plot(data_subset$Datetime, data_subset$Voltage,
     type = "l",
     xlab = "datetime",
     ylab = "Voltage")

# plot graph 3
plot(data_subset$Datetime, data_subset$Sub_metering_1,
     type = "l",
     xlab = "",
     ylab = "Energy sub metering")

lines(data_subset$Datetime, data_subset$Sub_metering_2,
      type = "l",
      col = "red")

lines(data_subset$Datetime, data_subset$Sub_metering_3,
      type = "l",
      col = "blue")

legend("topright",
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col = c("black","red","blue"),
       bty = "n",
       lty = 1)

# plot graph 4
plot(data_subset$Datetime, data_subset$Global_reactive_power,
     type = "l",
     xlab = "datetime",
     ylab = "Global_reactive_power")


# save file
dev.off()