#Data Science Specialization with R -> Coursera
#Exploratory Data Analysis
#Week-1
#Course Project
#Third Plot
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

#--------->Run the code from here if plot1.R is already run

elecSub$Sub_metering_1<-as.numeric(as.character(elecSub$Sub_metering_1))
elecSub$Sub_metering_2<-as.numeric(as.character(elecSub$Sub_metering_2))
elecSub$Sub_metering_3<-as.numeric(as.character(elecSub$Sub_metering_3))

DandT <- strptime(paste(elecSub$Date, elecSub$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
subMeter1 <- elecSub$Sub_metering_1
subMeter2 <- elecSub$Sub_metering_2
subMeter3 <- elecSub$Sub_metering_3

png("plot3.png", width=480, height=480)
plot(DandT, subMeter1, type="l", xlab="", ylab="Energy sub metering")
lines(DandT, subMeter2, col = "red")
lines(DandT, subMeter3, col = "blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),col=c("black","red", "blue"), lty=1, lwd=2.5)
dev.off()