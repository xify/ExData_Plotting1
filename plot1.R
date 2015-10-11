# Plot 1
# load data
library("dplyr")
hpc <- read.csv("household_power_consumption.txt", sep=";",
                colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"),
                stringsAsFactors=FALSE, na.strings="?")
hpc2 <- filter(hpc, Date=="1/2/2007" | Date=="2/2/2007")
hpc2 <- mutate(hpc2, DateTime = as.Date(strptime(paste(Date," ",Time), "%d/%m/%Y %H:%M:%S")))

# Plotting
png(filename="plot1.png", width=504, height=504)
hist(hpc2$Global_active_power,
     main = "Global Active Power", col="red", xlab="Global Active Power (killowatts)")
dev.off()