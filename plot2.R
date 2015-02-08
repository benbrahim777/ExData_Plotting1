



# get Data
source("load_myData.R")
myData_TwoDaysPeriod <- load_myData()




# Plots Constants
PlotWidth         <- 480
PlotHeight        <- 480
PlotUnits         <- "px"
PlotBg            <- "white"
PlotFileName      <- "./plot2.png"

MarginBottom      <- 8
MarginLeft        <- 8
MarginTop         <- 7
MarginRight       <- 6

PlotColsColor     <- "red"
PlotTitle         <- "Global Active Power"
PlotXLabel        <- ""
PlotYLabel        <- "Global Active Power (kilowatts)"

#Graphical Device is PNG
png(filename = PlotFileName , width = PlotWidth, height = PlotHeight, units = PlotUnits, bg = PlotBg)

# Graphical margins
par(mar = c(MarginBottom, MarginLeft, MarginTop, MarginRight))

# Graphic Plot
plot(myData_TwoDaysPeriod$Date_Time, myData_TwoDaysPeriod$Global_active_power,
     type="l",
     xlab=PlotXLabel,
     ylab=PlotYLabel)

# Close Graphical device
dev.off()

