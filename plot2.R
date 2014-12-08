library(ggplot2)

## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")

## Plot 2 -
plot2 <-aggregate(Emissions ~ year, subset(NEI, fips=="24510"), sum)
plot(Emissions ~ year, plot2, type = "b", main="Total Baltimore Emissions of PM2.5", xlab="Year", ylab="Emissions (tons)", xaxt="n")
axis(side=1, at=c("1999", "2002", "2005", "2008"))

dev.copy(png,file="plot2.png")
dev.off()
