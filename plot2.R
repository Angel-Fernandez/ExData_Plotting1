# My data file is located in my working dir
wd=getwd()
file_ <- paste(wd,'/household_power_consumption.txt',sep = "")

#Load data
data <- read.table(file_,sep = ";",header = TRUE, na.strings = "?", stringsAsFactors = FALSE)

# Get a data subset by time range
data <- data[which(data$Date=='1/2/2007' | data$Date=='2/2/2007'),]

# Join Data Time
date_and_time <- strptime(paste(data$Date,data$Time),"%d/%m/%Y %H:%M:%S")

# Open screen graphics
X11()
plot(date_and_time,data$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")

# Save result
dev.copy(device = png, filename = "plot2.png", width = 480, height = 480) 
dev.off()