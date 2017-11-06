library(sqldf)
data<-file("household_power_consumption.txt")

data_subset<-sqldf("select * from data where Date in ('1/2/2007','2/2/2007')", file.format = list(header = TRUE, sep=";"))

Date<-as.Date(data_subset$Date,"%d/%m/%Y")
Date_Time<-as.POSIXct(paste(Date,data_subset$Time))


plot(data_subset$Sub_metering_1~Date_Time, type="l", ylab="Energy sub metering", xlab="")
lines(data_subset$Sub_metering_2~Date_Time,col='Red')
lines(data_subset$Sub_metering_3~Date_Time,col='Blue')
legend("topright", col=c("black", "red", "blue"), lwd=c(1,1,1), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.copy(png,"plot3.png", width=480, height=480)
dev.off()