library(ggplot2)

## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
NEIsub <- NEI[c("fips","SCC","Emissions","type","year")]
SCCsub <- SCC[c("SCC","Short.Name")]

## plot 5 - take type ON-ROAD as indicator of motor vehicle sources 

plot5 <-aggregate(Emissions ~ year, subset(NEI, fips=="24510" & type=="ON-ROAD"), sum)

p <- ggplot(plot5, aes(year,Emissions)) + xlab("Year") + ylab("Emissions (Tons)") + ggtitle("Baltimore PM2.5 Emissions On Road by Year")

p+geom_point(color="steelblue", size=4, alpha= 1/2)+facet_grid(.~type)
ggsave(file="plot5.png")
