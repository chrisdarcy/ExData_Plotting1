
#Read in the data
powercons <- read.table("data/household_power_consumption.txt",sep=";",header=TRUE,na.strings = "?")

#Create a new DateTime column
powercons$DT <- strptime(paste(powercons$Date,powercons$Time), format="%d/%m/%Y %T")

#Convert the Date to a Date
powercons$Date <- as.Date(powercons$Date,format="%d/%m/%Y")

#We will only be using data from the dates 2007-02-01 and 2007-02-02. 
powercons <- powercons[which(powercons$Date >= as.Date("2007-02-01") & powercons$Date <= as.Date("2007-02-02")),] 

#Plot 3
png("Plot3.png",width = 480, height = 480)
plot(powercons$DT, as.numeric(powercons$Sub_metering_1)  , type="n",ylab="Energy sub metering",xlab="")
lines(powercons$DT, as.numeric(powercons$Sub_metering_1),col="black")
lines(powercons$DT, as.numeric(powercons$Sub_metering_2),col="red")
lines(powercons$DT, as.numeric(powercons$Sub_metering_3),col="blue")
legend("topright", lty=c(1,1),lwd=c(2.5,2.5,2.5), col = c("black","red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
dev.off()