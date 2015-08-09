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
png(filename="plot2.png", width = 480, height = 480, bg = "transparent")


# plot graph
plot(data_subset$Datetime, data_subset$Global_active_power,
     type = "l",
     xlab = "",
     ylab = "Global Active Power (kilowatts)")


# save file
dev.off()

