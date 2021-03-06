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
GlobalActivePower<-as.numeric(subsetData$Global_active_power)

#opens graphic device and creates plot
png("plot1.png", width=480, height=480)
hist(GlobalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()