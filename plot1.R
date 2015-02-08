## Plot1.R code
## Designed to recreate bar chart as part of EDA project 1
## Requires data from UC Irvine Machine Learning Repository to be downloaded and unzipped

setwd("C:/Users/Dan & Rach/Desktop/Data Science/EDA")

## Pull in the file pre sub-setted for solely the two days worth of data required
require(sqldf)
file <- c("./data/household_power_consumption.txt")
data_subset <- read.csv.sql(file, header = T, sep=";", 
  sql = "select * from file where (Date == '1/2/2007' OR Date == '2/2/2007')" )

## Plot bar chart, adding labels & colours
library(datasets)
png(file = "plot1.png", width = 480, height = 480)
hist(data_subset$Global_active_power, main="Global Active Power", col="red", 
    xlab="Global Active Power (kilowatts)")
dev.off()
