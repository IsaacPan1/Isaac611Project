library(tidyverse)

nyc_map <- read.csv("derived_data/nyc.csv")

s <- nyc_map %>%
  filter(World.Region %in% c(
    "Southern Europe", "Eastern Europe", "Western Europe", "Northern Europe", "Southern Asia",
    "Southeastern Asia", "Eastern Asia", "Western Asia", "Central Asia")) %>%
  mutate(class = case_when(
    World.Region %in% c("Southern Europe", "Eastern Europe", "Western Europe", "Northern Europe") ~ "Europe",
    World.Region %in% c("Southern Asia", "Southeastern Asia", "Eastern Asia", "Western Asia", "Central Asia") ~ "Asia"
  ))

write.csv(s, 'derived_data/euroasia.csv', row.names = T)