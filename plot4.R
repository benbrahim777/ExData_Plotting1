
# get Data
source("load_myData.R")
myData_TwoDaysPeriod <- load_myData()




# Plots Constants
PlotWidth         <- 480
PlotHeight        <- 480
PlotUnits         <- "px"
PlotBg            <- "white"
PlotFileName      <- "./plot4.png"

MarginBottom      <- 8
MarginLeft        <- 8
MarginTop         <- 7
MarginRight       <- 6

PlotLinesColor2   <- "blue"
PlotLinesColor    <- "red"
PlotColsColor     <- "black"
PlotTitle         <- "Global Active Power"
PlotXLabel        <- ""
PlotYLabel        <- "Energy sub metering"


#Graphical Device is PNG
png(filename = PlotFileName , width = PlotWidth, height = PlotHeight, units = PlotUnits, bg = PlotBg)


#Graphic with 2 lnes and two columns
par(mfrow=c(2,2))


# Graphic 1 Plot
plot(myData_TwoDaysPeriod$Date_Time, myData_TwoDaysPeriod$Global_active_power,
     type="l",
     xlab="",
     ylab="Global Active Power")

# Graphic 2 Plot
plot(myData_TwoDaysPeriod$Date_Time, myData_TwoDaysPeriod$Voltage, type="l",
     xlab="datetime", ylab="Voltage")

# Graphic 3 Plot
plot(myData_TwoDaysPeriod$Date_Time, myData_TwoDaysPeriod$Sub_metering_1, col = PlotColsColor,
     type="l",
     xlab=PlotXLabel,
     ylab=PlotYLabel)

lines(myData_TwoDaysPeriod$Date_Time, myData_TwoDaysPeriod$Sub_metering_2, col=PlotLinesColor)
lines(myData_TwoDaysPeriod$Date_Time, myData_TwoDaysPeriod$Sub_metering_3, col=PlotLinesColor2)
legend("topright",col=c("black", "red", "blue"), c("Sub_metering_1", 
                 "Sub_metering_2", "Sub_metering_3"), lty=1)



# Graphic 4 Plot
plot(myData_TwoDaysPeriod$Date_Time, myData_TwoDaysPeriod$Global_reactive_power, type="n",
     xlab="datetime", ylab="Global_reactive_power")
lines(myData_TwoDaysPeriod$Date_Time, myData_TwoDaysPeriod$Global_reactive_power)

# Close Graphical device
dev.off()



