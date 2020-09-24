##plot2
baltimoredata <- NEI[NEI$fips=="24510", ]
baltimoreYearlyemmission <- aggregate(Emissions ~ year, baltimoredata, sum)
cols1 <- c("maroon", "yellow", "orange", "Aquamarine")
barplot(height=baltimoreYearlyemmission$Emissions/1000, names.arg=baltimoreYearlyemmission$year, xlab="Year", ylab=expression('Aggregated Emission'),main=expression('Baltimore Aggregated PM'[2.5]*' Emmissions by Year'), col = cols1)
