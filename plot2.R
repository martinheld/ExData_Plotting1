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


# Plot 2
png("plot2.png",width=480, height=480)
plot(data$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xaxt='n',xlab="")
axis(1,at=c(1,which(day_names=="Fri")[1],length(day_names)), labels=c("Thu","Fri","Sat"))
dev.off()

