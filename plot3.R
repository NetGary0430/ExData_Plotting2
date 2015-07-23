## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Load the ggplot2 library

library(ggplot2)

## subset the data for Baltimore
subsetNEI  <- NEI[NEI$fips=="24510", ]

## Use the aggregate command from plot1.R again

aggTotYrType <- aggregate(Emissions ~ year + type, subsetNEI, sum)

## Plot the data using ggplot2

png("plot3.png", width=640, height=480)
g <- ggplot(aggTotYrType, aes(year, Emissions, color = type))
g <- g + geom_line() +
    xlab("year") +
    ylab(expression('Total PM'[2.5]*" Emissions")) +
    ggtitle('Total Emissions in Baltimore City, Maryland (fips == "24510") from 1999 to 2008')
print(g)
dev.off()
