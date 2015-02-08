## Plot2.R code
## Designed to recreate bar chart as part of EDA project 1
## Requires data from UC Irvine Machine Learning Repository to be downloaded and unzipped

setwd("C:/Users/Dan & Rach/Desktop/Data Science/EDA")

## Pull in the file pre sub-setted for solely the two days worth of data required
require(sqldf)
file <- c("./data/household_power_consumption.txt")
data_subset <- read.csv.sql(file, header = T, sep=";", 
  sql = "select * from file where (Date == '1/2/2007' OR Date == '2/2/2007')" )

data_subset$datetime<-as.POSIXct(paste(data_subset$Date,data_subset$Time), format="%d/%m/%Y %H:%M:%S")

## Plot bar chart, adding labels & colours
library(datasets)
png(file = "plot2.png", width = 480, height = 480)
plot(data_subset$datetime, data_subset$Global_active_power, type="l",
     xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
