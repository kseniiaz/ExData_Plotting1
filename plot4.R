library(sqldf)
data<-file("household_power_consumption.txt")

data_subset<-sqldf("select * from data where Date in ('1/2/2007','2/2/2007')", file.format = list(header = TRUE, sep=";"))

Date<-as.Date(data_subset$Date,"%d/%m/%Y")
Date_Time<-as.POSIXct(paste(Date,data_subset$Time))


par(mfrow=c(2,2))

plot(data_subset$Global_active_power~Date_Time, type="l", ylab="Global Active Power", xlab="")

plot(data_subset$Voltage~Date_Time, type="l", ylab="Voltage", xlab="datetime")

plot(data_subset$Sub_metering_1~Date_Time, type="l", ylab="Energy sub metering", xlab="")
lines(data_subset$Sub_metering_2~Date_Time,col='Red')
lines(data_subset$Sub_metering_3~Date_Time,col='Blue')
legend("topright", col=c("black", "red", "blue"), lwd=c(1,1,1), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),bty="n")

plot(data_subset$Global_reactive_power~Date_Time, type="l", ylab="Global Rective Power",xlab="datetime")

dev.copy(png,"plot4.png", width=480, height=480)
dev.off()

