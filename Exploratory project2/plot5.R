## Load data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# How have emissions from motor vehicle sources changed from 1999-2008 in Baltimore City?

NEIsubset <- NEI[NEI$fips == "24510"&NEI$type=="ON-ROAD",]
TotalEmission <- aggregate(Emissions~year,NEIsubset,sum)

library(ggplot2)

png("plot5.png", width=800, height=480)
g <- ggplot(TotalEmission,aes(factor(year),Emissions))+
  geom_bar(stat="identity",fill="#0072B2")+
  ggtitle("Total emissions of motor vehicle sources in Baltimore City from 1999-2008")+
  xlab("Year")+
  ylab(expression('Total PM'[2.5]*' emissions'))

print(g)
dev.off()
