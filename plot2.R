# store the file location
h <- file("data/household_power_consumption.txt")

# read file for specific dates. The missing values are coded as "?".
hpc <- read.table(text = grep("^[1,2]/2/2007", readLines(h), value = TRUE), 
                  col.names = c("Date", "Time", "Global_active_power", 
                                "Global_reactive_power", "Voltage", 
                                "Global_intensity", "Sub_metering_1", 
                                "Sub_metering_2", "Sub_metering_3"), 
                  sep = ";", na.strings = "?", header = TRUE)


hpc_dt <- paste(as.Date(hpc$Date, format="%d/%m/%Y"), hpc$Time)
hpc$dt <- as.POSIXct(hpc_dt)


# starting the graphics device png of 480px x 480px size
png("plot2.png", width=480, height=480, units="px")

# create the plot with labels
plot(hpc$Global_active_power ~ hpc$dt, 
     type="l",
     ylab="Global Active Power (kilowatts)",
     xlab="")


#stop the PNG device
dev.off()
