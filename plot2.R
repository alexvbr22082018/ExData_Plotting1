
table <- read.table("./power/household_power_consumption.txt",
                    sep=";",colClasses = c("character","character","numeric","numeric","numeric",
                                           "numeric","numeric","numeric","numeric"),
                    dec=".",fill=T,quote="",header = T,na.strings = "?")

table$datetime <- strptime(paste(table$Date,
                                 table$Time),
                           format = "%d/%m/%Y %H:%M:%S")


table <- table[table$Date %in% c("1/2/2007","2/2/2007"),]



png("./submit/plot2.png",width = 480,height = 480,units = "px")
with(data = table,plot(x = datetime,
                       y=Global_active_power,
                       type="l",
                       lwd=1,
                       lty=1,
                       bty='n',
                       ylab = "Global Active Power (kilowatts)",
                       xlab=""
))
dev.off()


