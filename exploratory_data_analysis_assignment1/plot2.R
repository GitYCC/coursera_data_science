# change locate for language of date 
Sys.setlocale(category = "LC_ALL", locale = "English_United States.1252")

# load data
df <- read.csv(file = './extracted_data.csv',header = TRUE)
df$Date_Time <- as.POSIXct(strptime( paste(df$Date,df$Time) , format='%d/%m/%Y %H:%M:%S'))

# create PNG file
png(file="./plot2.png",width=480,height=480,bg='transparent')
par(mfrow=c(1,1),mar=c(5,5,2,2))
plot(df$Date_Time, df$Global_active_power,type = 'l', pch=NA, xlab=NA, ylab='Global Active Power (kilowatts)')
dev.off()