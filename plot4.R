
#Read in the data
powercons <- read.table("data/household_power_consumption.txt",sep=";",header=TRUE,na.strings = "?")

#Create a new DateTime column
powercons$DT <- strptime(paste(powercons$Date,powercons$Time), format="%d/%m/%Y %T")

#Convert the Date to a Date
powercons$Date <- as.Date(powercons$Date,format="%d/%m/%Y")

#We will only be using data from the dates 2007-02-01 and 2007-02-02. 
powercons <- powercons[which(powercons$Date >= as.Date("2007-02-01") & powercons$Date <= as.Date("2007-02-02")),] 

#Plot 4

png("Plot4.png",width = 480, height = 480)
par(mfrow = c(2,2))

#repeat plot 2
plot(powercons$DT, as.numeric(powercons$Global_active_power)  , type="n",ylab="Global Active Power",xlab="")
lines(powercons$DT, as.numeric(powercons$Global_active_power))

#new plot -Voltage
plot(powercons$DT, as.numeric(powercons$Voltage)  , type="n",ylab="Voltage",xlab="datetime")
lines(powercons$DT, as.numeric(powercons$Voltage))

#repeat plot 3
plot(powercons$DT, as.numeric(powercons$Sub_metering_1)  , type="n",ylab="Energy sub metering",xlab="")
lines(powercons$DT, as.numeric(powercons$Sub_metering_1),col="black")
lines(powercons$DT, as.numeric(powercons$Sub_metering_2),col="red")
lines(powercons$DT, as.numeric(powercons$Sub_metering_3),col="blue")
legend("topright", lty=c(1,1),lwd=c(2.5,2.5,2.5), col = c("black","red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))

#new plot - Global Reactive Power
plot(powercons$DT, as.numeric(powercons$Global_reactive_power), type="n",ylab="Global_reactive_power",xlab="datetime")
lines(powercons$DT, as.numeric(powercons$Global_reactive_power),col="black")

dev.off()