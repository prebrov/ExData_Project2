## Q3. Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City? Which have seen increases in emissions from 1999–2008? Use the ggplot2 plotting system to make a plot answer this question.

## Read data sets
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


## Subset Baltimore data
baltimoreNEI <- subset(NEI, fips == "24510")

## Aggregate total emissions for each year by type
baltimorePerYearByType <- aggregate(Emissions ~ year + type, baltimoreNEI, sum)

library(ggplot2)
## Plot as lines, group and color by type
png(filename = "plot3.png", width = 480, height = 480)
ggplot(baltimorePerYearByType, aes(x=year, y=Emissions, group=type, colour=type)) +
    geom_point() + geom_line() +
    xlab("Year") + ylab("Total Emissions")
dev.off()