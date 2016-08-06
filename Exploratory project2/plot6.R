## Load data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Compare emissions from motor vehicle sources in Baltimore City with emissions 
# from motor vehicle sources in Los Angeles County, California (fips == "06037"). 
# Which city has seen greater changes over time in motor vehicle emissions?

NEIsubset <- NEI[(NEI$fips == "06037" | NEI$fips == "24510") & NEI$type == "ON-ROAD",]

TotalEmission <- aggregate(Emissions~fips+year,NEIsubset,sum)
TotalEmission$fips[TotalEmission$fips=="24510"] <- "Baltimore City"
TotalEmission$fips[TotalEmission$fips=="06037"] <- "Los Angeles County"

library(ggplot2)

png("plot6.png",width=900)
g <- ggplot(TotalEmission,aes(factor(year),Emissions))+
  facet_grid(.~fips)+
  geom_bar(stat="identity",fill="#0072B2")+
  ggtitle("Total emissions from motor vehicle sources in Baltimore City v.s. Los Angeles County from 1999-2008")+
  xlab("Year")+
  ylab(expression('Total PM'[2.5]*' emissions'))
print(g)
dev.off()
  