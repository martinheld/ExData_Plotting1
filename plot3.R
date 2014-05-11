if (!file.exists("household_power_consumption.txt")) {
  download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip","dataset.zip","curl")
  unzip("dataset.zip")
}

col_names <- unlist(read.table("household_power_consumption.txt",na.strings = "?",nrows=1,sep=";"))
data <- read.table("household_power_consumption.txt",na.strings = "?",skip=66637,nrows=2880,sep=";")
colnames(data) <- col_names

# set time formatting to us to obtain english weekday names
Sys.setlocale("LC_TIME","en_US")

day_names <- weekdays(as.Date(strptime(data$Date,format="%d/%m/%Y")),abbreviate=T)


# Plot 3
png("plot3.png",width=480, height=480)
col_def = c("black","red","blue")

matplot(cbind(data$Sub_metering_1,data$Sub_metering_2,data$Sub_metering_3),col=col_def,type="l",lty=1,ylab="Energy sub metering",xaxt='n')
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=col_def,lty=1)
axis(1,at=c(1,which(day_names=="Fri")[1],length(day_names)), labels=c("Thu","Fri","Sat"))
dev.off()

