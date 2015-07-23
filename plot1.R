## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Summarize total emissions from all sources by year
## The aggregate command Splits the data into subsets, computes summary statistics for each, 
##     and returns the result in a convenient form.

aggregatedTotalByYear <- aggregate(Emissions ~ year, NEI, sum)

## Plot the data in a bar chart

png('plot1.png')
barplot(height=aggregatedTotalByYear$Emissions, names.arg=aggregatedTotalByYear$year, xlab="years", ylab=expression('total PM'[2.5]*' emission'),main=expression('Total PM'[2.5]*' emissions at various years'))

## Turn off the print device to actually write the file
dev.off()



