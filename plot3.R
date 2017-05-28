# Reading the source file
data <- read.table("household_power_consumption.txt", header=T, sep=";")

#Date format conversion
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

#Extracting the required data based on Date condition
data1 <- data[(data$Date=="2007-02-01") | (data$Date=="2007-02-02"),]

#Conversion of Timestamp to a dataframe(POSIXct)
data1 <- transform(data1, timestamp=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")

#Conversion ofSub-metering data to Numeric Format
data1$Sub_metering_1 <- as.numeric(as.character(data1$Sub_metering_1))
data1$Sub_metering_2 <- as.numeric(as.character(data1$Sub_metering_2))
data1$Sub_metering_3 <- as.numeric(as.character(data1$Sub_metering_3))

#Plotting of Graph with required coloring and labeling
plot(data1$timestamp,data1$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(data1$timestamp,data1$Sub_metering_2,col="red")
lines(data1$timestamp,data1$Sub_metering_3,col="blue")

#Adding Legends in the Top right corner for color classification
legend("topright", col=c("black","red","blue"), c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),lty=c(1,1), lwd=c(1,1))

#Copying the data from Windows Device to a PNG format file with required specs
dev.copy(png, file="plot3.png", width=480, height=480)

#Turning Off the PNG Graphic Device
dev.off()