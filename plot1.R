# Set language to english to obtain required spelling for days
Sys.setlocale("LC_TIME", "en_US")

#Read data
data = read.table("./data/household_power_consumption.txt",sep=";", header = T)
#convert date and time data
data$datetime = paste(data$Date, data$Time, sep= " ")
data$datetime = strptime(data$datetime, format="%d/%m/%Y %H:%M:%S")
data$Date = strptime(data$Date, "%d/%m/%Y")
data$Time = strptime(data$Time,"%H:%M:%S")
# subset the data to keep only the 2 days required for the analysis
subdata = data[(data$Date<=strptime("02/02/2007", "%d/%m/%Y") & data$Date>=strptime("01/02/2007", "%d/%m/%Y")),]
# convert measures in numeric values
subdata$Global_active_power = as.numeric(as.character(subdata$Global_active_power))
subdata$Global_reactive_power = as.numeric(as.character(subdata$Global_reactive_power))
subdata$Voltage = as.numeric(as.character(subdata$Voltage))
subdata$Sub_metering_1 = as.numeric(as.character(subdata$Sub_metering_1))
subdata$Sub_metering_2 = as.numeric(as.character(subdata$Sub_metering_2))
subdata$Sub_metering_3 = as.numeric(as.character(subdata$Sub_metering_3))

#Initiate a png file (480x480) and draw plot 1
png(file="./data/plot1.png",width = 480, height = 480, units = "px")
par(mfcol=c(1,1), mar=c(4,4,2,0), oma=c(2,1,1,1))
hist(subdata$Global_active_power, col ="red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()