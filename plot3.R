
## Download files and load the libraries needed to set up
## current Working directory

source("environment.R")
setupwd()

png("plot3.png")
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
                            col = "blue"))
dev.off()
