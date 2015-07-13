# Function plot2 plot the Global Active Power from the Electric Power consumption data over 
# the day (x-axis) and saves it as plot2.png
plot2 <- function() {
    
    setwd("C:/Users/Gebruiker/Documents/@Courses/RCode/04 Exploratory Data Analysis/PRJ1")
    Sys.setlocale("LC_TIME", "English")
    
    dfEPCData <- GetEPC()
    png(filename = "plot2.png",
        width = 480, height = 480, units = "px")
    plot(x=dfEPCData$Timestamp, 
         y=dfEPCData$Global_active_power, 
         type="l",
         xlab=NA,
         ylab="Global Active Power (kilowatts)")
    dev.off()
    
    Sys.setlocale("LC_TIME", "Dutch")
}

# This function reads the energy consumption of 1 household and builds and returns a dataframe with
# data from the dates 2007-02-01 and 2007-02-02. 
# Convert the Date and Time variables to Date/Time
# Replace missing values (coded as ?) with NA
GetEPC <- function () {
    
    setwd("C:/Users/Gebruiker/Documents/@Courses/RCode/04 Exploratory Data Analysis/PRJ1")
    
    # Data is sorted on date so for now the data will be read from - to certain lines
    # Later on readLines could be used  and per data record checked on date
    # 1 datarecord per minute. Number of data records in 2 days = 2 * 24 * 60 = 2880 records
    # 2007-02-01 starts @ line 66638
    # 2007-02-02 ends @ line 69517
    
    # By skipping line the header is skipped too. Add header as column names after reading data
    strFile <- "./household_power_consumption.txt"
    strHeader <- read.csv(strFile, nrows = 1, header = FALSE, sep = ";", stringsAsFactors = FALSE)
    dfEnergyConsumption <- read.csv(strFile, header=FALSE,sep=";",skip=66637, nrows=69518-66638)
    colnames(dfEnergyConsumption) <- unlist(strHeader)
    
    # Convert the Date and Time variables to Date/Time classes in new Timestamp column
    dfEnergyConsumption$Timestamp <- strptime(paste(dfEnergyConsumption$Date,dfEnergyConsumption$Time),"%d/%m/%Y %H:%M:%S")
    
    # Data doens't contain missing values (coded as ?). If time left, replace ? with NA
    # df[df=="?"]<-NA or
    # per column by df$colname <- ifelse(df$colname == "?", NA, df$colname)
    return(dfEnergyConsumption)
}
