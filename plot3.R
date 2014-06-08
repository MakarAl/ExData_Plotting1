## To run the script set current folder as the working directory and ensure the 
## 'household_power_consumption.txt' file is unpacked in this folder.

hpc <- read.table("household_power_consumption.txt",header=T,sep=";",
                  colClasses=c("character","character","double","double","double","double",
                               "double","double","numeric"),na.strings="?")
hpc$DateTime = paste(hpc$Date, hpc$Time)
hpc$DateTime = as.POSIXlt(hpc$DateTime,format="%d/%m/%Y %H:%M:%S")
hpc$Date = NULL
hpc$Time = NULL

hpcsubset <- subset(hpc,DateTime$year==107 & DateTime$mon==1 & (DateTime$mday==1 | DateTime$mday==2))

png("plot3.png")
par(bg = "transparent")
plot(x=(hpcsubset$DateTime),y=hpcsubset$Sub_metering_1,type="l",ylab="Energy sub metering",xlab="")
lines(x=(hpcsubset$DateTime),y=hpcsubset$Sub_metering_2,col="red")
lines(x=(hpcsubset$DateTime),y=hpcsubset$Sub_metering_3,col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),bty="l",
                                                    col=c("black","red","blue"),lwd=2,cex=0.7)
dev.off()