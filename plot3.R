
table <- read.table("./power/household_power_consumption.txt",
                    sep=";",colClasses = c("character","character","numeric","numeric","numeric",
                                           "numeric","numeric","numeric","numeric"),
                    dec=".",fill=T,quote="",header = T,na.strings = "?")

table$datetime <- strptime(paste(table$Date,
                                 table$Time),
                           format = "%d/%m/%Y %H:%M:%S")


table <- table[table$Date %in% c("1/2/2007","2/2/2007"),]



png("./submit/plot3.png",width = 480,height = 480,units = "px")
with(data = table,{
  plot(datetime,
       Sub_metering_1,
       type="l",
       xlab = "",
       ylab=" Energy sub metering"
  )
  lines(datetime,
        Sub_metering_2,
        type="l",col="red"
  )
  
  lines(table$datetime,
        table$Sub_metering_3,
        type="l",
        col="blue"
  )
  legend("topright",
         col=c("black","blue","red"),
         legend=c("Sub_metering_1",
                  "Sub_metering_2",
                  "Sub_metering_3"),
         lty=1)
  
}
)
dev.off()


