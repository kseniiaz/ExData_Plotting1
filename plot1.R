library(sqldf)
data<-file("household_power_consumption.txt")

data_subset<-sqldf("select * from data where Date in ('1/2/2007','2/2/2007')", file.format = list(header = TRUE, sep=";"))

Date<-as.Date(data_subset$Date,"%d/%m/%Y")
Date_Time<-as.POSIXct(paste(Date,data_subset$Time))


hist(data_subset$Global_active_power, main="Global Active Power", xlab = "Global Active Power (kilowatts)", col="red")
dev.copy(png,"plot1.png", width=480, height=480)
dev.off()

