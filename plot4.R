
table <- read.table("./power/household_power_consumption.txt",
                    sep=";",colClasses = c("character","character","numeric","numeric","numeric",
                                           "numeric","numeric","numeric","numeric"),
                    dec=".",fill=T,quote="",header = T,na.strings = "?")

table$datetime <- strptime(paste(table$Date,
                                 table$Time),
                           format = "%d/%m/%Y %H:%M:%S")


table <- table[table$Date %in% c("1/2/2007","2/2/2007"),]


png("./submit/plot4.png",width = 480,height = 480,units = "px")

par(mfrow=c(2,2),mar=c(4,4,2,1),oma=c(0,0,2,0))


with(data = table,plot(x = datetime,
                       y=Global_active_power,
                       type="l",
                       lwd=1,
                       lty=1,
                       bty='n',
                       xlab=""
))

with(data = table,plot(x = datetime,
                       y= Voltage,
                       type="l",
                       lwd=1,
                       lty=1,
                       bty='n',
                       xlab="datetime"
))


with(data = table,{
  plot(datetime,
       Sub_metering_1,
       type="l",
       xlab = "",
       ylab="Energy sub metering"
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
         lty=1,cex = 0.5,bty="n")
  
})

with(data = table,plot(x = datetime,
                       y=Global_reactive_power,
                       type="l",
                       lwd=1,
                       lty=1,
                       bty='n',
                       xlab="datetime"
))



dev.off()


