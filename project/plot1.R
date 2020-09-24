NEI <- readRDS("summarySCC_PM25.rds")
head(NEI)
str(NEI)
dim(NEI)
SCC <- readRDS("Source_Classification_Code.rds")
yearly_emmissions <- aggregate(Emissions ~ year, NEI, sum)
##Plot1
cols <- c("maroon", "orange", "yellow", "Aquamarine")
barplot(height=yearly_emmissions$Emissions/1000, names.arg=yearly_emmissions$year, xlab="Year", ylab=expression('Aggregated Emission'),main=expression('Aggregated PM'[2.5]*' Emmissions by Year'), col = cols)
