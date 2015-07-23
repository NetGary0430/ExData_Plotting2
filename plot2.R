## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Subset the data by using the Baltimore code provided.
subsetNEI  <- NEI[NEI$fips=="24510", ]

## Use the aggregate commange to summarize
aggTotByYear <- aggregate(Emissions ~ year, subsetNEI, sum)

## Plot the graph

png('plot2.png')
barplot(height=aggTotByYear$Emissions, names.arg=aggTotByYear$year, xlab="years", ylab=expression('total PM'[2.5]*' emission'),main=expression('Total PM'[2.5]*' in the Baltimore City, MD emissions at various years'))

## Turn off the print device to form the file

dev.off()
