
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


# plot 4 
  png(file = 'plot4.png', width = 480, height = 480)
  
  par(mfrow= c(2,2))
  with(data, plot( x = full_date,
                   y = Global_active_power, 
                   type = 'l',
                   xlab = '',
                   ylab = 'Global Active Power'))
  
  with(data, plot( x = full_date, 
                   y = Voltage, 
                   type = 'l', 
                   xlab = 'datetime', 
                   ylab = 'Voltage'))  
  
  with(data, plot( x= full_date, 
                   y = Sub_metering_1, 
                   type="l", 
                   ylab = 'Energy sub metering', 
                   xlab = ''))
  with(data, lines( x = full_date, 
                    y = Sub_metering_2, 
                    col = 'red'))
  with(data, lines( x= full_date, 
                    y= Sub_metering_3, 
                    col = 'blue'))
  legend("topright", 
         lty = 1, 
         col = c('black', 'red', 'blue'), 
         legend = c('Sub_metering_1','Sub_metering_2','Sub_metering_3')) 
  
  with(data, plot( x= full_date, 
                   y = Global_reactive_power, 
                   type = 'l', 
                   xlab = 'datetime', 
                   ylab = 'Global_reactive_power'))
  dev.off()

                   