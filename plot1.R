
#Read in the data
powercons <- read.table("data/household_power_consumption.txt",sep=";",header=TRUE,na.strings = "?")

#Create a new DateTime column
powercons$DT <- strptime(paste(powercons$Date,powercons$Time), format="%d/%m/%Y %T")

#Convert the Date to a Date
powercons$Date <- as.Date(powercons$Date,format="%d/%m/%Y")

#We will only be using data from the dates 2007-02-01 and 2007-02-02. 
powercons <- powercons[which(powercons$Date >= as.Date("2007-02-01") & powercons$Date <= as.Date("2007-02-02")),] 

#Plot 1 - Global_Active_Power
png("Plot1.png",width = 480, height = 480)
hist(as.numeric(powercons$Global_active_power),col = "red", xlab="Global Active Power (kilowatts)", main="Global Active Power" )
dev.off()
