# Reading the source file
data <- read.table("household_power_consumption.txt", header=T, sep=";")

#Date format conversion
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

#Extracting the required data based on Date condition
data1 <- data[(data$Date=="2007-02-01") | (data$Date=="2007-02-02"),]

#Conversion of Global Active Power column data to Numeric Format
data1$Global_active_power <- as.numeric(as.character(data1$Global_active_power))

#Plotting of Histogram
hist(data1$Global_active_power, main = "Global Active Power", col="red", xlab="Global Active Power (kilowatts)")

#Copying the data from Windows Device to a PNG format file
dev.copy(png, file="plot1.png", width=480, height=480)

#Turning Off the PNG Graphic Device
dev.off()