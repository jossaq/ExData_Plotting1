
## Main function to download the file needed and set up the data like we need it

setupwd <- function() {
    
    ## Load all the libraries needed
    
    library("dplyr")
    library("lubridate")
    
    ## Download and unzip the Data Set into HARUSDataSet folder
    dataset_url <- paste("https://d396qusza40orc.cloudfront.net/exdata%2F",
                         "data%2Fhousehold_power_consumption.zip",
                         sep = "")
    zipfile <- "exdata-data-household_power_consumption.zip"
    
    ## Download the .zip file unless it already exists
    if (!file.exists("household_power_consumption.txt")) { 
        if (!file.exists(zipfile)) {
            download.file(dataset_url, zipfile)
        }
        
        ## Extract everything into the "UCI HAR Dataset" directory unless the directory
        ## exists
        unzip(zipfile)
    }
    ## If powerconsumption data table doesn't exists, load it into enviroment

    if (!exists("powerconsumption")) {
        tmppower <- tbl_df(read.csv("household_power_consumption.txt", sep = ";"))
        tmppower$Date <- dmy(tmppower$Date)
        powerconsumption <- filter(tmppower, Date == "2007-02-01" |
                                       Date == "2007-02-02")
        
        rm("tmppower") # Remove tmppower as it is no longer needed
        
        # Convert the variables we need as numbers
        
        powerconsumption$Global_active_power <- as.numeric(as.character(
            powerconsumption$Global_active_power))
        
        powerconsumption <- mutate(powerconsumption,
                                   datetime = ymd_hms(paste(
                                       powerconsumption$Date,
                                       powerconsumption$Time)))
        
        powerconsumption$Sub_metering_1 <- as.numeric(as.character(
            powerconsumption$Sub_metering_1))
        powerconsumption$Sub_metering_2 <- as.numeric(as.character(
            powerconsumption$Sub_metering_2))
        powerconsumption$Sub_metering_3 <- as.numeric(as.character(
            powerconsumption$Sub_metering_3))
        
        powerconsumption$Voltage <- as.numeric(as.character(
            powerconsumption$Voltage))
        
        powerconsumption$Global_reactive_power<- as.numeric(as.character(
            powerconsumption$Global_reactive_power))
        
        powerconsumption <<- powerconsumption
    }
}
