## Q1. Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? Using the base plotting system, make a plot showing the total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008.

## Read data sets
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Compute total emissions for each year
totalPerYear <- tapply(NEI$Emissions, NEI$year, sum)

## Plot the line to see if emissions have decreased
png(filename = "plot1.png", width = 480, height = 480)
plot(as.data.frame(totalPerYear), type = "l", col = "darkblue",
     xlab = "Year", ylab = "Total Emissions",
     main = "Total emissions (1999 - 2008)")
dev.off()