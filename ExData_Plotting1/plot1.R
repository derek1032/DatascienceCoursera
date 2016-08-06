# data setting
data <- read.table("household_power_consumption.txt",sep=';',skip=66637,nrow=2880)
colnames(data)=c('Date','Time','Global_active_power','Global_reactive_power','Voltage','lobal_intensity','Sub_metering_1','Sub_metering_2','Sub_metering_3')
data$Date <- as.Date(data$Date,format='%d/%m/%Y');data$Time <- strptime(data$Time,format='%H:%M:%S') 

# plot
png(filename="plot1.png")
hist(data$Global_active_power,col='red',xlab='Global Active Power(kilowatts)',main='Global Active Power')
dev.off()
