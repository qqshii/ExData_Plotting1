
library(datasets)
library(lubridate)
library(dplyr)

# pull data 
  setwd("C:/Users/u57m27/Desktop/Coursera/Data Science/4.Exploratory Data Analysis")
  data <- read.table("household_power_consumption.txt", header = TRUE, sep =";")
  data <- data %>% filter(Date %in% c("1/2/2007", "2/2/2007"))


# prepare data for plot
  data$full_date <- dmy_hms(paste(data$Date, data$Time))
  data[, c(3:9)] <- sapply(data[, c(3:9)], as.numeric)
  str(data)

# plot 1
  png(file = 'plot1.png', width = 480, height = 480)
  
  with(data, hist(Global_active_power, 
                  col = 'red',
                  xlab = 'Global Active Power (kilowatts)', 
                  main = 'Global Active Power'))
  dev.off()
    

                   