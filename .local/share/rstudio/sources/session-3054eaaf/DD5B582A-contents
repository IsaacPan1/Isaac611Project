library(viridis)
library(tidyverse)

nyc <- read.csv("source_data/nyc_languages.csv", sep=";")

#following lines go onto a new line which missaligns their columns
#219-222 columbian spanish
#514-517 jewish neo-armaric
#568-571 kham tibetan
#606-607 kyiron
#1275-6 jewish neo-armaric description too long and on wrong line

#remove missaligned rows/columns

nyc_cln <- nyc[-c(219:222, 514:517, 568:571, 606:607, 1275:1276),]


nyc_map <- nyc_cln %>% select(Language, World.Region, Language.Family, Latitude, Longitude) %>% filter(complete.cases(.)) %>% filter(Language != "", World.Region != "", World.Region != "367357", Latitude != "", Longitude != "", Language.Family != "")

#latitudes and longitudes have dots that cannot be read a numeric

# Replace extra dots with nothing (removes them)
nyc_map$Latitude <- gsub("\\.", "", nyc_map$Latitude)
nyc_map$Longitude <- gsub("\\.", "", nyc_map$Longitude)

#then reinsert the decimal
nyc_map$Latitude <- sapply(nyc_map$Latitude, function(x) paste0(substr(x, 1, 2), ".", substr(x, 3, nchar(x))))
nyc_map$Longitude <- sapply(nyc_map$Longitude, function(x) paste0(substr(x, 1, 3), ".", substr(x, 4, nchar(x))))


#then make data numeric
nyc_map$Latitude <- as.numeric(nyc_map$Latitude)
nyc_map$Longitude <- as.numeric(nyc_map$Longitude)

write.csv(nyc_map, "derived_data/nyc.csv", row.names = TRUE)