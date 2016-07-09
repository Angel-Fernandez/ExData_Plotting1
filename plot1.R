# My data file is located in my working dir
wd=getwd()
file_ <- paste(wd,'/household_power_consumption.txt',sep = "")

# Load data
data <- read.table(file_,sep = ";",header = TRUE, na.strings = "?", stringsAsFactors = FALSE)

# Get a data subset by time range
data <- data[which(data$Date=='1/2/2007' | data$Date=='2/2/2007'),]

# Select 
X11()
hist(data$Global_active_power, main="Global Active Power",xlab="Global Active Power (kilowatts)",col ="red")

# Save result
dev.copy(device = png, filename = "plot1.png", width = 480, height = 480) 
dev.off()