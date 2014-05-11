if (!file.exists("household_power_consumption.txt")) {
  download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip","dataset.zip","curl")
  unzip("dataset.zip")
}

col_names <- unlist(read.table("household_power_consumption.txt",na.strings = "?",nrows=1,sep=";"))
data <- read.table("household_power_consumption.txt",na.strings = "?",skip=66637,nrows=2880,sep=";")
colnames(data) <- col_names

# Plot 1
png("plot1.png",width=480, height=480)
hist(data$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.off()

