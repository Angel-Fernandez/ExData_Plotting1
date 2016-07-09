# My data file is located in my working dir
wd=getwd()
file_ <- paste(wd,'/household_power_consumption.txt',sep = "")

# Load data
data <- read.table(file_,sep = ";",header = TRUE, na.strings = "?", stringsAsFactors = FALSE)

# Get a data subset by time range
data <- data[which(data$Date=='1/2/2007' | data$Date=='2/2/2007'),]

# Join Data Time
date_and_time <- strptime(paste(data$Date,data$Time),"%d/%m/%Y %H:%M:%S")

# Open screen graphics
X11()

# Set image array
par(mfrow=c(2,2))

# plot left up
plot(date_and_time,data$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")

# plot right up
plot(date_and_time,data$Voltage,ylab="Voltage",type="l",xlab="datetime")

# plot left down
plot(date_and_time, data$Sub_metering_1,type="l",ylab="Energy sub metering",xlab="",col="black")
lines(date_and_time, data$Sub_metering_2, col="red")
lines(date_and_time, data$Sub_metering_3, col="blue")
legend("topright", lty=1, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),col = c("black", "red", "blue"))

# plot right down
plot(date_and_time,data$Global_reactive_power,ylab="Global_reactive_power",type="l",xlab="datetime")

# Save result
dev.copy(device = png, filename = "plot4.png", width = 480, height = 480) 
dev.off()