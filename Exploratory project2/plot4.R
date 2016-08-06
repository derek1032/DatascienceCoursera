## Load data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Across the United States, how have emissions from coal combustion-related sources 
# changed from 1999-2008? 
library(ggplot2)

coalrelated <- grepl("coal", SCC$Short.Name, ignore.case=TRUE) 
SCCsubset <- SCC[coalrelated,]
SCCcoal <- SCCsubset$SCC
NEIsubset <- NEI[factor(NEI$SCC)%in%SCCcoal,]

TotalEmission <- aggregate(Emissions~year,NEIsubset,sum)

png("plot4.png",width=600)
g <- ggplot(TotalEmission,aes(factor(year),Emissions))+
  geom_bar(stat="identity",fill="#0072B2")+
  ggtitle("Total emissions of coal combustion-related sources from 1999-2008")+
  ylab(expression('Total PM'[2.5]*' emissions'))+
  xlab("Year")

print(g)
dev.off()



