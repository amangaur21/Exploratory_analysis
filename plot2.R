
# Reading the source file
data <- read.table("household_power_consumption.txt", header=T, sep=";")

#Date format conversion
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

#Extracting the required data based on Date condition
data1 <- data[(data$Date=="2007-02-01") | (data$Date=="2007-02-02"),]

#Conversion of Global Active Power column data to Numeric Format
data1$Global_active_power <- as.numeric(as.character(data1$Global_active_power))

#Conversion of Timestamp to a dataframe(POSIXct)
data1 <- transform(data1, timestamp=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")

#Plotting of Graph 
plot(data1$timestamp,data1$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

#Copying the data from Windows Device to a PNG format file with required specs
dev.copy(png, file="plot2.png", width=480, height=480)

#Turning Off the PNG Graphic Device
dev.off()