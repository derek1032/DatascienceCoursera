# data setting
data <- read.table("household_power_consumption.txt",sep=';',skip=66637,nrow=2880)
colnames(data)=c('Date','Time','Global_active_power','Global_reactive_power','Voltage','lobal_intensity','Sub_metering_1','Sub_metering_2','Sub_metering_3')
data$Time <- paste(data$Date,data$Time)
data$Date <- as.Date(data$Date,format='%d/%m/%Y');data$Time <- strptime(data$Time,format='%d/%m/%Y %H:%M:%S') 

# plot
png(filename="plot2.png")
plot(data$Time,data$Global_active_power,typ='l',xlab='',ylab='Global Active Power(kilowatts)')
dev.off()
