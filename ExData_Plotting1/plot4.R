# data setting
data <- read.table("household_power_consumption.txt",sep=';',skip=66637,nrow=2880)
colnames(data)=c('Date','Time','Global_active_power','Global_reactive_power','Voltage','lobal_intensity','Sub_metering_1','Sub_metering_2','Sub_metering_3')
data$Time <- paste(data$Date,data$Time)
data$Date <- as.Date(data$Date,format='%d/%m/%Y');data$Time <- strptime(data$Time,format='%d/%m/%Y %H:%M:%S') 

# plot
png(filename="plot4.png")
par(mfrow=c(2,2))

plot(data$Time,data$Global_active_power,typ='l',xlab='',ylab='Global Active Power')

plot(data$Time,data$Voltage,typ='l',xlab='datetime',ylab='Voltage')

plot(data$Time,data$Sub_metering_1,typ='l',xlab='',ylab='Energy sub metering')
lines(data$Time,data$Sub_metering_2,col='red')
lines(data$Time,data$Sub_metering_3,col='blue')
legend('topright',legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),col=c('black','red','blue'),lwd=1,bty='n' )

plot(data$Time,data$Global_reactive_power,typ='l',xlab='datetime',ylab='Global_reactive_power')

dev.off()