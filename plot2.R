DPCTotal<-data.frame(read.table("household_power_consumption.txt",
                                sep=";", header=TRUE,na.strings="?")) ##Inputs the file into R

library(dplyr)
DPCTotal$DateTime<-as.POSIXct(strptime(paste(DPCTotal$Date,DPCTotal$Time),format="%d/%m/%Y %H:%M:%S"))
DPCTotal<-mutate(DPCTotal,Date=as.Date(Date,format="%d/%m/%Y"))
DPCSubset<-subset(DPCTotal,DPCTotal$Date=="2007-02-01"|Date=="2007-02-02")

png("plot2.png",width = 480,height = 480)
plot(DPCSubset$DateTime,DPCSubset$Global_active_power, type="n", xlab="",ylab="Global Active Power (kilowatts)")
lines(DPCSubset$DateTime,DPCSubset$Global_active_power)
dev.off()
