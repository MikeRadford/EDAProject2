library(ggplot2)

## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
NEIsub <- NEI[c("fips","SCC","Emissions","type","year")]
SCCsub <- SCC[c("SCC","Short.Name")]

## plot 4 - 

plot4source <- merge(NEIsub, SCCsub, by = "SCC")
plot4all <- subset(plot4source, grepl("Coal",plot4source$Short.Name))
plot4 <- aggregate(Emissions ~ year, plot4all, sum)

p <- ggplot(plot4, aes(year,Emissions)) + xlab("Year") + ylab("Emissions (Tons)") + ggtitle("Total US PM2.5 Coal Emissions by Year")
p+geom_point(color="steelblue", size=4, alpha= 1/2)+geom_line()
ggsave(file="plot4.png")
