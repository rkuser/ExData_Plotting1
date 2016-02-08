#memory required = no. of column * no. of rows * 8 bytes/numeric

#power_consumption = read.table("~/Desktop/Coursera/household_power_consumption 2.txt") 
#bytes_per_numeric <- 8
#memory_required = ncol(mydata)*nrow(mydata) * bytes_per_numeric
# [1] 18677340 

power_consumption <- read.csv("~/Desktop/Coursera/household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                              nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
power_consumption$Date <- as.Date(power_consumption$Date, format="%d/%m/%Y")

# subset data
subset_data <- subset(power_consumption, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

# convert dates
datetime <- paste(as.Date(subset_data$Date), subset_data$Time)
subset_data$Datetime <- as.POSIXct(datetime)


hist(power_consumption$Global_active_power,col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

dev.copy(png, file="~/Desktop/Coursera/plot1.png", height=480, width=480)
dev.off()
