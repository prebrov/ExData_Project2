## Q2. Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") from 1999 to 2008? Use the base plotting system to make a plot answering this question.

## Read data sets
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


## Subset Baltimore data
baltimoreNEI <- subset(NEI, fips == "24510")

## Aggregate total emissions for each year
baltimorePerYear <- aggregate(Emissions ~ year, baltimoreNEI, sum)

## Plot the line to see if emissions have decreased
png(filename = "plot2.png", width = 480, height = 480)
plot(baltimorePerYear, type = "l", col = "darkblue",
     xlab = "Year", ylab = "Total Emissions",
     main = "Total emissions (1999 - 2008)")
dev.off()