plot1 <- function()
{
	#Download and unzip data. 
	#If you are running this script more than once, you can comment the following three lines after the first time.
	fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip";	
	download.file(fileUrl, destfile = "data.zip");	
	unzip("data.zip");
	
	dataset <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?");
	
	dataset$Date <- as.Date(dataset$Date, format = "%d/%m/%Y") #"26/11/2015"; #format = "%Y-%m-%d");
	
	subset1 <- subset(dataset, !is.na(dataset[,3]) & Date > as.Date("2007-01-31") & Date < as.Date("2007-02-03"));
	
	png("plot1.png")
	hist(subset1[,3], xlab = "Global Active Power(kilowatts)", ylab = "Frecuency", col = "red", main = "Global Active Power")
	dev.off()	
}