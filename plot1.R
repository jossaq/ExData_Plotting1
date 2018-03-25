
## Download files and load the libraries needed to set up
## current Working directory

source("environment.R")
setupwd()

png("plot1.png")
hist(powerconsumption$Global_active_power, col = "red",
     main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()
