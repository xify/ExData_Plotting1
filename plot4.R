# Plot 4
# load data
library("dplyr")
hpc <- read.csv("household_power_consumption.txt", sep=";",
                colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"),
                stringsAsFactors=FALSE, na.strings="?")
hpc2 <- filter(hpc, Date=="1/2/2007" | Date=="2/2/2007")
hpc2 <- mutate(hpc2, DT = paste(Date," ",Time))
hpc2$DateTime = strptime(hpc2$DT, "%d/%m/%Y %H:%M:%S")

# Plotting
png(filename="plot4.png", width=504, height=504)
par(mfrow=c(2,2))
with(hpc2, {
  # plot 1
  plot(DateTime, Global_active_power, type="l",
    main="", col="black", xlab="", ylab="Global Active Power")
  # plot 2
  plot(DateTime, Voltage, type="l",
       main="", col="black", xlab="datetime", ylab="Voltage")
  # plot 3
  plot(
  DateTime, Sub_metering_1, type="n",
  main="", col="black", xlab="", ylab="Energy sub metering"
  )
  with(hpc2, lines(DateTime, Sub_metering_1, col="black"))
  with(hpc2, lines(DateTime, Sub_metering_2, col="red"))
  with(hpc2, lines(DateTime, Sub_metering_3, col="blue"))
  legend("topright",
         legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
         col=c("black","red","blue"), lty="solid", lwd=1, bty="n")
  # plot 4
  plot(DateTime, Global_reactive_power, type="l",
       main="", col="black", xlab="datetime", ylab="Global_reactive_power")
})
dev.off()