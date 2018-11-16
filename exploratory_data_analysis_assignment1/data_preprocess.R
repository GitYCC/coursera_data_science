# download raw data
download.file('https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip',destfile = './household_power_consumption.zip')
unzip('./household_power_consumption.zip')

# load raw data
df <- read.table(file = './household_power_consumption.txt',sep = ';',header = TRUE)

# get data on 'Date' 2007-02-01 and 2007-02-01 from raw data and output it as CSV format
output <- df[ as.Date(strptime(df$Date,format = '%d/%m/%Y')) %in% as.Date(c('2007/2/1','2007/2/2')), ]
write.csv(output,"extracted_data.csv",row.names = FALSE, quote = FALSE)