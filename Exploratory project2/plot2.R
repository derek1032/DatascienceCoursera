## Load data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Plot
Baltimore <- NEI[NEI$fips == "24510",]
emissions <- aggregate(Emissions~year,Baltimore,sum)
png(filename="plot2.png")
barplot(emissions$Emissions,names.arg=emissions$year,col="blue",
        ylab=expression('Total PM'[2.5]*' emissions'),xlab="Year",
        main=expression('Total PM'[2.5]*' emissions in the Baltimore City at various years'))
dev.off()

