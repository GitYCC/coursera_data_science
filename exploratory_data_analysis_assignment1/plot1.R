# load data
df <- read.csv(file = './extracted_data.csv',header = TRUE)

# create PNG file
png(file="./plot1.png",width=480,height=480,bg='transparent')
par(mfrow=c(1,1),mar=c(5,5,2,2))
hist(df$Global_active_power, col='red', main='Global Active Power', xlab = 'Global Active Power (kilowatts)')
dev.off()