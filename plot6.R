library(ggplot2)

## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
NEIsub <- NEI[c("fips","SCC","Emissions","type","year")]
SCCsub <- SCC[c("SCC","Short.Name")]

## plot 6 - take type ON-ROAD as vehicle
plot6 <-aggregate(Emissions ~ year+fips, subset(NEI, (fips == "24510" | fips == "06037") & type=="ON-ROAD"), sum)
plot6$city <- ifelse(plot6$fips=="06037", "Los Angeles", "Baltimore")
p <- ggplot(plot6, aes(year,Emissions)) + xlab("Year") + ylab("Emissions (Tons)") + ggtitle("Baltimore vs LA Motor Vehicle PM2.5 Emissions by Year")

p+geom_point(color="steelblue", size=4, alpha= 1/2)+facet_grid(.~city)
ggsave(file="plot6.png")
