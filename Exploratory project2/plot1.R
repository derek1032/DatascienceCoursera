## Load data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Plot
library(plyr)
emission <- ddply(NEI, "year",numcolwise(sum))

png(filename="plot1.png")
barplot(height=emission$Emissions,width=0.1,names.arg=emission$year,xlab="Year",
     ylab=expression('Total PM'[2.5]*' emissions'),main=expression('Total PM'[2.5]*' emissions at various years'),col="blue")
dev.off()