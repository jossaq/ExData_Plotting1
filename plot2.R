
## Download files and load the libraries needed to set up
## current Working directory

source("environment.R")
setupwd()

png("plot2.png")
with(powerconsumption, plot(datetime, Global_active_power, type = "l",
                            xlab = "",
                            ylab = "Global Active Power (kilowatts)"))
dev.off()
