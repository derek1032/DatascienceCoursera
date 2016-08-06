## Load data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable,  
# which of these four sources have seen decreases in emissions from 1999 2008 for Baltimore City?  
# Which have seen increases in emissions from 1999 2008?  
# Use the ggplot2 plotting system to make a plot answer this question. 

library(ggplot2)
library(plyr)
Baltimore <- NEI[NEI$fips == "24510",]
Difftype <- ddply(Baltimore,c("type","year"),numcolwise(sum))

g <- ggplot(Difftype,aes(x=year,y=Emissions,color=type)) +
  geom_line() + 
  labs(title=expression('Total PM'[2.5]*' emissions in the Baltimore City for different types')) +
  labs(x="Year") +
  labs(y=expression('Total PM'[2.5]*' emissions'))
png("plot3.png")  
print(g)
dev.off() 
