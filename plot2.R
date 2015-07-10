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
