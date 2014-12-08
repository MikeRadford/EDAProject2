library(ggplot2)

## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
NEIsub <- NEI[c("fips","SCC","Emissions","type","year")]
SCCsub <- SCC[c("SCC","Short.Name")]


## Plot 1 - 
plot1 <- aggregate(Emissions ~ year, NEI, sum)
plot(Emissions ~ year, plot1, type = "b", main="Total US Emissions of PM2.5", xlab="Year", ylab="Emissions (tons)", xaxt="n")
axis(side=1, at=c("1999", "2002", "2005", "2008"))

dev.copy(png,file="plot1.png")
dev.off()
