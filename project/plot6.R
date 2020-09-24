##Plot6
## Comparing Baltimore, MD-24510 and Los Angeles, CA-06037
baltimoreyearlytypeemmissionFips <- summarise(group_by(filter(NEI, NEI$fips == "24510"& type == 'ON-ROAD'), year), Emissions=sum(Emissions))
la_year_type_emmission <- summarise(group_by(filter(NEI, NEI$fips == "06037"& type == 'ON-ROAD'), year), Emissions=sum(Emissions))

baltimoreyearlytypeemmissionFips$County <- "Baltimore City, MD"
la_year_type_emmission$County <- "Los Angeles County, CA"

balt_la_emmissions <- rbind(baltimoreyearlytypeemmissionFips, la_year_type_emmission)

## Type: ON-ROAD, Fips = 24510 for Baltimore, MD Motor Vehicle PM[2.5]* Emissions Against Los Angeles, CA Fips = 06037  from 1999 to 2008
ggplot(balt_la_emmissions, aes(x=factor(year), y=Emissions, fill=County,label = round(Emissions,2))) +
  geom_bar(stat="identity") + 
  facet_grid(County~., scales="free") +
  ylab(expression("total PM"[2.5]*" emissions in tons")) + 
  xlab("year") +
  ggtitle(expression("Baltimore City vs Los Angeles County Motor vehicle emission in tons"))+
  geom_label(aes(fill = County),colour = "yellow", fontface = "bold")
