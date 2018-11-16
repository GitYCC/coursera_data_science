# change locate for language of date 
Sys.setlocale(category = "LC_ALL", locale = "English_United States.1252")

# load data
df <- read.csv(file = './extracted_data.csv',header = TRUE)
df$Date_Time <- as.POSIXct(strptime( paste(df$Date,df$Time) , format='%d/%m/%Y %H:%M:%S'))

# create PNG file
png(file="./plot4.png",width=480,height=480,bg='transparent')
par(mfrow=c(2,2),mar=c(5,5,2,2))
plot(df$Date_Time, df$Global_active_power, type = 'l', xlab=NA, ylab='Global Active Power')
plot(df$Date_Time, df$Voltage, type = 'l', xlab='datetime', ylab='Voltage')
plot(df$Date_Time, df$Sub_metering_1, type = 'n', xlab=NA, ylab='Engergy sub metering')
lines(df$Date_Time, df$Sub_metering_1, type = 'l', col='black')
lines(df$Date_Time, df$Sub_metering_2, type = 'l', col='red')
lines(df$Date_Time, df$Sub_metering_3, type = 'l', col='blue')
legend('topright',lty=c(1,1,1), col=c('black','red','blue'), legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'), bty='n')
plot(df$Date_Time, df$Global_reactive_power, type = 'l', xlab='datetime', ylab='Global_reactive_Power')
dev.off()