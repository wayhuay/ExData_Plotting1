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
png(filename="plot1.png", width = 480, height = 480, bg = "transparent")


# plot histogram
hist(data_subset$Global_active_power,
     col = "red",
     xlab = "Global Active Power (kilowatts)",
     ylab = "Frequency",
     main = "Global Active Power")

# save the png file
dev.off()

