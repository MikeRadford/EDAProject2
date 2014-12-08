library(ggplot2)

## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")


## Plot 3 -
plot3 <- aggregate(Emissions ~ year + type, subset(NEI, fips=="24510"), sum)

p <- ggplot(plot3, aes(year,Emissions)) + xlab("Year") + ylab("Emissions (Tons)") + ggtitle("Baltimore PM2.5 Emissions by Type and Year")

p+geom_point(color="steelblue", size=4, alpha= 1/2)+facet_grid(.~type)
ggsave(file="plot3.png")
