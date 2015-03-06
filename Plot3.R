##Check if required packages are installed.  If they are not they are installed
packages<-function(x){
  x<-as.character(match.call()[[2]])
  if (!require(x,character.only=TRUE)){
    install.packages(pkgs=x,repos="http://cran.r-project.org")
    require(x,character.only=TRUE)
  }
}
packages(dplyr)

#reads and subsets the data
data<-read.table("household_power_consumption.txt", header=TRUE, stringsAsFactors=FALSE, sep=";", dec=".")
subsetData<-filter(data, Date=="1/2/2007" | Date=="2/2/2007")

#transforms variables
dateTime <- strptime(paste(subsetData$Date, subsetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
Sub_metering_1<-as.numeric(subsetData$Sub_metering_1)
Sub_metering_2<-as.numeric(subsetData$Sub_metering_2)
Sub_metering_3<-as.numeric(subsetData$Sub_metering_3)

#opens graphic device and creates plot
png("plot3.png", width=480, height=480)
plot(dateTime, Sub_metering_1, type= "lty", xlab="", ylab="Energy sub meetering")
points(dateTime, Sub_metering_1, type="lty")
points(dateTime, Sub_metering_2, type="lty", col="red")
points(dateTime, Sub_metering_3, type="lty", col="blue")
legend("topright", lty=1, col=c("black", "red", "blue"), legend=c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))
dev.off()