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

png("plot1.png")
par(bg = "transparent")
hist(hpcsubset$Global_active_power,main="Global Active Power",ylab="Frequency",
     xlab="Global Active Power (kilowatts)",col="red",ylim=c(0,1200))
dev.off()