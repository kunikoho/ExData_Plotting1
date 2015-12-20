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
png("plot3.png", width=480, height=480, bg="transparent", units="px")

# create the plot with labels
plot(hpc$Sub_metering_1 ~ hpc$dt, 
     type="l",
     ylab="Energy sub metering",
     xlab="")

lines(hpc$Sub_metering_2 ~ hpc$dt , col="Red")
lines(hpc$Sub_metering_3 ~ hpc$dt, col='Blue')

# Create legend
legend("topright", col=c("Black", "Red", "Blue"), lty=1, lwd=2,
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))


#stop the PNG device
dev.off()
