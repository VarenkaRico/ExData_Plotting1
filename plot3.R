DPCTotal<-data.frame(read.table("household_power_consumption.txt",
                                sep=";", header=TRUE,na.strings="?")) ##Inputs the file into R

library(dplyr)
DPCTotal$DateTime<-as.POSIXct(strptime(paste(DPCTotal$Date,DPCTotal$Time),format="%d/%m/%Y %H:%M:%S"))
DPCTotal<-mutate(DPCTotal,Date=as.Date(Date,format="%d/%m/%Y"))
DPCSubset<-subset(DPCTotal,DPCTotal$Date=="2007-02-01"|Date=="2007-02-02")

png("plot3.png",width = 480,height = 480)
plot(DPCSubset$DateTime,DPCSubset$Sub_metering_1, type="n", xlab="",ylab="Energy Sub metering")
lines(DPCSubset$DateTime,DPCSubset$Sub_metering_1, col="black")
lines(DPCSubset$DateTime,DPCSubset$Sub_metering_2, col="red")
lines(DPCSubset$DateTime,DPCSubset$Sub_metering_3, col="blue")
legend("topright", col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),pch=c(NA,NA,NA),lty=c(1,1,1))
dev.off()