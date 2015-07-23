## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Load the ggplot2 library

library(ggplot2)

# Compare emissions from motor vehicle sources in Baltimore City with emissions from motor 
# vehicle sources in Los Angeles County, California (fips == "06037"). 


# 24510 is Baltimore, see plot2.R, 06037 is LA CA
# Searching for ON-ROAD type in NEI

subsetNEI <- NEI[(NEI$fips=="24510"|NEI$fips=="06037") & NEI$type=="ON-ROAD",  ]


aggTotByYearAndFips <- aggregate(Emissions ~ year + fips, subsetNEI, sum)
aggTotByYearAndFips$fips[aggTotByYearAndFips$fips=="24510"] <- "Baltimore, MD"
aggTotByYearAndFips$fips[aggTotByYearAndFips$fips=="06037"] <- "Los Angeles, CA"


png("plot6.png", width=1040, height=480)
g <- ggplot(aggTotByYearAndFips, aes(factor(year), Emissions))
g <- g + facet_grid(. ~ fips)
g <- g + geom_bar(stat="identity")  +
    xlab("year") +
    ylab(expression('Total PM'[2.5]*" Emissions")) +
    ggtitle('Total Emissions from motor vehicle (type=ON-ROAD) in Baltimore City, MD (fips = "24510") vs Los Angeles, CA (fips = "06037")  1999-2008')
print(g)
dev.off()
