# Reading the source file
data <- read.table("household_power_consumption.txt", header=T, sep=";")

#Date format conversion
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

#Conversion of Global Active Power column data to Numeric Format
data1$Global_active_power <- as.numeric(as.character(data1$Global_active_power))

#Conversion of Timestamp to a dataframe(POSIXct)
data1 <- transform(data1, timestamp=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")

#Conversion of Voltage column data to Numeric format
data1$Voltage <- as.numeric(as.character(data1$Voltage))

#Defining mutiple plotting i.e., 2 graphs per row and column
par(mfrow=c(2,2))

#PLOT 1
plot(data1$timestamp,data1$Global_active_power, type="l", xlab="", ylab="Global Active Power")

#PLOT 2
plot(data1$timestamp,data1$Voltage, type="l", xlab="datetime", ylab="Voltage")

#PLOT 3
plot(data1$timestamp,data1$Sub_metering_1, type="l", ylab="Energy sub metering")
lines(data1$timestamp,data1$Sub_metering_2,col="red")
lines(data1$timestamp,data1$Sub_metering_3,col="blue")
legend("topright", col=c("black","red","blue"), c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),lty=c(1,1), cex=0.4, bty="n")

#PLOT 4
plot(data1$timestamp,data1$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

#Copying the data from Windows Device to a PNG format file with required specs
dev.copy(png, file="plot4.png", width=480, height=480)

#Turning Off the PNG Graphic Device
dev.off()