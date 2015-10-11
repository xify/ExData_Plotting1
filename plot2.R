# Plot 2
# load data
library("dplyr")
hpc <- read.csv("household_power_consumption.txt", sep=";",
                colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"),
                stringsAsFactors=FALSE, na.strings="?")
hpc2 <- filter(hpc, Date=="1/2/2007" | Date=="2/2/2007")
hpc2 <- mutate(hpc2, DT = paste(Date," ",Time))
hpc2$DateTime = strptime(hpc2$DT, "%d/%m/%Y %H:%M:%S")

# Plotting
png(filename="plot2.png", width=504, height=504)
with(hpc2, plot(
  DateTime, Global_active_power, type="l",
  main="", col="black", xlab="", ylab="Global Active Power (killowatts)"
))
dev.off()