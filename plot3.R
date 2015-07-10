# Function plot3 reads the Electric Power consumption data. Plots the Sub Metering data on a 
# daily bases (x-axis) and saves it as plot3.png
plot3 <- function() {
    
    setwd("C:/Users/Gebruiker/Documents/@Courses/RCode/04 Exploratory Data Analysis/PRJ1")
    Sys.setlocale("LC_TIME", "English")
    
    dfEPCData <- GetEPC()
    png(filename = "plot3.png",
        width = 480, height = 480, units = "px")
    plot(x=dfEPCData$Timestamp, 
         y=dfEPCData$Sub_metering_1, 
         type="l",
         xlab=NA,
         ylab="Energy sub metering")
    lines(x=dfEPCData$Timestamp,y=dfEPCData$Sub_metering_2, col = "red")
    lines(x=dfEPCData$Timestamp,y=dfEPCData$Sub_metering_3, col = "blue")
    legend("topright", pch = "_", col = c("black", "blue", "red"), 
           legend = c("Sub_metering_1", "Sub_metering_2" , "Sub_metering_3"))
    dev.off()
    
    Sys.setlocale("LC_TIME", "Dutch")
}