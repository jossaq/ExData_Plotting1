
## Download files and load the libraries needed to set up
## current Working directory

source("environment.R")
setupwd()

png("plot4.png")

## Set the canvas as 2 by 2

par(mfrow = c(2,2))

## Draw the plot2 into the fist slot

with(powerconsumption, plot(datetime, Global_active_power, type = "l",
                            xlab = "",
                            ylab = "Global Active Power (kilowatts)"))

## Draw Voltage vs. Datetime

with(powerconsumption, plot(datetime, Voltage, type = "l",
                            xlab = "datetime",
                            ylab = "Voltage"))

## Draw plot3 into the third slot

with(powerconsumption, plot(datetime, Sub_metering_1, type = "n", xlab = "",
                            ylab = "Energy sub metering"))

with(powerconsumption, points(datetime, Sub_metering_1, 
                              col = "black", type = "l"))

with(powerconsumption, points(datetime, Sub_metering_2,
                              col = "red", type = "l"))

with(powerconsumption, points(datetime, Sub_metering_3,
                              col = "blue", type = "l"))

legend("topright", legend = c("Sub_metering_1",
                              "Sub_metering_2",
                              "Sub_metering_3"),
       lty = 1,
       col = c(col = "black",
               col = "red",
               col = "blue"),
       bty="n")

## Draw the last plot into the 4 plot canvas, Global_reactive_power vs. datetime

with(powerconsumption, plot(datetime, Global_reactive_power, type = "l",
                            xlab = "datetime",
                            ylab = "Voltage"))

dev.off()
