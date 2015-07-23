## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Load the ggplot2 library

library(ggplot2)

## Get records with Short.Name (SCC) Coal
## Use grep to search for pattern match "coal"
coalMatches  <- grepl("coal", NEISCC$Short.Name, ignore.case=TRUE)

## Subset the data
subsetNEISCC <- NEISCC[coalMatches, ]

## Use the aggregate command to summarize the data
aggTotYr <- aggregate(Emissions ~ year, subsetNEISCC, sum)

## Plot the data using ggplot2

png("plot4.png", width=640, height=480)
g <- ggplot(aggTotYr, aes(factor(year), Emissions))
g <- g + geom_bar(stat="identity") +
    xlab("year") +
    ylab(expression('Total PM'[2.5]*" Emissions")) +
    ggtitle('Total Emissions from coal sources from 1999 to 2008')
print(g)

## Turn off the print device so the file is created
dev.off()

