plot2 <- function()
{
	#Download and unzip data. 
	#If you are running this script more than once, you can comment the following three lines after the first time.
	fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip";	
	download.file(fileUrl, destfile = "data.zip");	
	unzip("data.zip");
	
	dataset <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?");
	
	x <- paste(dataset$Date, dataset$Time);
	
	dataset$Date <- strptime(x, "%d/%m/%Y %H:%M:%S")
	
	lt <- strptime(paste(c("31/1/2007"), c("23:59:59")), "%d/%m/%Y %H:%M:%S")
	ht <- strptime(paste(c("3/2/2007"), c("00:00:00")), "%d/%m/%Y %H:%M:%S")
	
	subset1 <- subset(dataset, !is.na(dataset[,3]) & Date > lt & Date < ht);
	
	png("plot2.png")
	plot(subset1[,1], subset1[,3], ylab = "Global Active Power(kilowatts)", xlab = "", main = "", pch = ".")
	lines(subset1$Date,subset1$Global_active_power)
	dev.off()	
}