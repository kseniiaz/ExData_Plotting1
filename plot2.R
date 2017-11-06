library(sqldf)
data<-file("household_power_consumption.txt")

data_subset<-sqldf("select * from data where Date in ('1/2/2007','2/2/2007')", file.format = list(header = TRUE, sep=";"))

Date<-as.Date(data_subset$Date,"%d/%m/%Y")
Date_Time<-as.POSIXct(paste(Date,data_subset$Time))


plot(data_subset$Global_active_power~Date_Time, type="l", ylab="Global Active Power (kilowatts)", xlab="")
dev.copy(png,"plot2.png", width=480, height=480)
dev.off()