library(ggplot)

nyc_map <- read.csv("derived_data/nyc.csv")

ggplot(nyc_map, aes(x = Latitude, y = Longitude, color = World.Region)) + geom_point()

saveWidget(region.plt, "figures/region")