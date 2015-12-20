# store the file location
h <- file("data/household_power_consumption.txt")

# read file for specific dates. The missing values are coded as "?".
hpc <- read.table(text = grep("^[1,2]/2/2007", readLines(h), value = TRUE), 
                  col.names = c("Date", "Time", "Global_active_power", 
                                "Global_reactive_power", "Voltage", 
                                "Global_intensity", "Sub_metering_1", 
                                "Sub_metering_2", "Sub_metering_3"), 
                  sep = ";", na.strings = "?", header = TRUE)

# starting the graphics device png of 480px x 480px size
png("plot1.png", width=480, height=480, bg="transparent", units="px")

# create a histogram
hist(hpc$Global_active_power, 
     col="steelblue",
     main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)")

#stop the PNG device
dev.off()
