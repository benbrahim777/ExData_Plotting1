

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

fileName = "household_power_consumption.txt"

# loading datatable library
library(data.table)


# Get and unzip File from web Url

url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
localZippedfileName    <- "./household_power_consumption.zip"
download.file(url, localZippedfileName ) 
unzip(localZippedfileName, exdir = ".")
#dateDownloaded <- date() ################
#dateDownloaded ###################

# Read file in a datatable
myData <- fread(fileName, header=TRUE, sep=";", colClasses="character",  na="?")

# format dates
myData$Date <- as.Date(myData$Date, format=FormatDate)

# Get data of two days in a dataFrame
myData_TwoDaysPeriod <-   myData[myData$Date >= StartDate & myData$Date <= EndDate]
myData_TwoDaysPeriod <-   data.frame(myData_TwoDaysPeriod)


# Convert some columns to numeric format
for(col in c(StartNumericalCol:StartNumericalCol)) {
  myData_TwoDaysPeriod[,col] <- as.numeric(as.character(myData_TwoDaysPeriod[,col]))
}


# Create and Format DateTime column
myData_TwoDaysPeriod$Date_Time <- paste(myData_TwoDaysPeriod$Date, myData_TwoDaysPeriod$Time)
myData_TwoDaysPeriod$Date_Time <- strptime(myData_TwoDaysPeriod$Date_Time, format = FormatDateTime)

# return data
return (myData_TwoDaysPeriod)

}
