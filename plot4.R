# Function plot4 reads the Electric Power consumption data. Plots 4 graphs to png file: 
# Global Active Power, Energy Sub metering, Voltage and Global reactive power
plot4 <- function() {
    
    setwd("C:/Users/Gebruiker/Documents/@Courses/RCode/04 Exploratory Data Analysis/PRJ1")
    Sys.setlocale("LC_TIME", "English")
    
    dfEPCData <- GetEPC()

    png(filename = "plot4.png",
        width = 480, height = 480, units = "px")
    
    par(mfcol = c(2, 2))
    with(dfEPCData, {
        # Global Active Power
        plot(x=Timestamp, 
             y=Global_active_power, 
             type="l",
             xlab=NA,
             ylab="Global Active Power (kilowatts)")

        # Energy sub metering
        plot(x=Timestamp, 
             y=Sub_metering_1, 
             type="l",
             xlab=NA,
             ylab="Energy sub metering")
        lines(x=Timestamp,y=Sub_metering_2, col = "red")
        lines(x=Timestamp,y=Sub_metering_3, col = "blue")
        legend("topright", pch = "_", col = c("black", "blue", "red"), 
               legend = c("Sub_metering_1", "Sub_metering_2" , "Sub_metering_3"))
        
        # Voltage
        plot(x=Timestamp, 
             y=Voltage, 
             type="l",
             xlab="datetime")
        
        # Global reactive power
        plot(x=Timestamp, 
             y=Global_reactive_power, 
             type="l",
             xlab="datetime")
        
    })
    
    dev.off()
    
    Sys.setlocale("LC_TIME", "Dutch")
}