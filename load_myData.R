

# Function to retrieve data from file
load_myData <- function() {

# Dates informations and formats
StartDate         <- "2007-02-01"
EndDate           <- "2007-02-02"
FormatDate        <- "%d/%m/%Y"
FormatDateTime    <- "%Y-%m-%d %H:%M:%S"

#Numerical columns in data
StartNumericalCol <- 3
EndNumericalCol   <- 9



# loading datatable library
library(data.table)
file    <- "./household_power_consumption.txt"

# Read file in a datatable
myData <- fread(file, header=TRUE, sep=";", colClasses="character",  na="?")

# format dates
myData$Date <- as.Date(myData$Date, format=FormatDate)

# Get data of two days
myData_TwoDaysPeriod <-  myData[myData$Date >= StartDate & myData$Date <= EndDate]
myData_TwoDaysPeriod <- data.frame(myData_TwoDaysPeriod)


# Convert some columns to numeric format
for(col in c(StartNumericalCol:StartNumericalCol)) {
  myData_TwoDaysPeriod[,col] <- as.numeric(as.character(myData_TwoDaysPeriod[,col]))
}


# Format DateTime
myData_TwoDaysPeriod$DateTime <- paste(myData_TwoDaysPeriod$Date, myData_TwoDaysPeriod$Time)
myData_TwoDaysPeriod$DateTime <- strptime(myData_TwoDaysPeriod$DateTime, format = FormatDateTime)

# return data
return (myData_TwoDaysPeriod)

}
