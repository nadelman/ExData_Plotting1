# read in file. assumed that the input file is simply the unzipped file provided for the assignment,
# located in the working directory
df <- read.table(file='./household_power_consumption.txt', sep=";", 
                 col.names=c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"));

#subset subset to 2007-02-01 and 2007-02-02 right away
df <- subset(df, as.character(df$Date) == "1/2/2007" | as.character(df$Date) == "2/2/2007");

# create a timestamp column as the concatination of the date and time field
df$timestamp <- strptime(paste(df$Date, df$Time), "%d/%m/%Y %H:%M:%S");

#fix column data types and formats
df$Global_active_power <- as.numeric(levels(df$Global_active_power)[df$Global_active_power]);
df$Global_reactive_power <- as.numeric(levels(df$Global_reactive_power)[df$Global_reactive_power]);
df$Voltage <- as.numeric(levels(df$Voltage)[df$Voltage]);
df$Global_intensity <- as.numeric(levels(df$Global_intensity)[df$Global_intensity]);
df$Sub_metering_1 <- as.numeric(levels(df$Sub_metering_1)[df$Sub_metering_1]);
df$Sub_metering_2 <- as.numeric(levels(df$Sub_metering_2)[df$Sub_metering_2]);
df$Sub_metering_3 <- as.numeric(levels(df$Sub_metering_3)[df$Sub_metering_3]);


#plot
par(new=F);
with(df, plot(timestamp, Global_active_power , type="l",  ylab = "Global Active Power (Kilowatts)", xlab=""));

# write plot to file
dev.copy(png, file = "plot2.png");
dev.off();

