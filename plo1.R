#Data Science Specialization with R -> Coursera
#Exploratory Data Analysis
#Week-1
#Course Project
#First Plot
#Manish K Mittal
#05/08/2020
#Please change the 

library(ggplot2)
oldpath<-getwd()
wdpath<-"C:\\Users\\H202442\\Google Drive\\Coursera-DataScience\\Exploratory data analysis\\Week1"
setwd(wdpath)
zipfilepath<-"C:\\Users\\H202442\\Google Drive\\Coursera-DataScience\\Exploratory data analysis\\Week1\\exdata_data_household_power_consumption.zip"
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",zipfilepath)
unzip(zipfilepath)
elecData<-read.table("household_power_consumption.txt",sep=";",dec=".",header=TRUE)
elecSub<-subset(elecData,Date == '1/2/2007' | Date == '2/2/2007')

elecSub$Date<-as.Date(elecSub$Date)
elecSub$Global_active_power<-as.numeric(as.character(elecSub$Global_active_power))
png(file="plot1.png", width=480, height=480)
hist(elecSub$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", main = "Global Active Power")
dev.off()
setwd(oldpath)