

powercons$D <- as.character(powercons$Date)
powercons$T <- as.character(powercons$Time)

powercons$DT <- paste(powercons$D,powercons$T)

strptime(powercons$DT, format="%d/%m/%Y %T")

strptime(powercons$DT, format="")

strptime("16/12/2006 17:24:00", format="%d/%m/%Y %T")

strptime(paste(powercons$Date,powercons$Time), format="%d/%m/%Y %T")