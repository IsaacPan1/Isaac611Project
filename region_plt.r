library(tidyverse)
library(leaflet)
library(htmlwidgets)

nyc_map <- read.csv("derived_data/nyc.csv")

region.plt <- leaflet(nyc_map) %>%
  addTiles() %>%  # Add OpenStreetMap tiles
  addCircleMarkers(
    lat = ~Latitude, 
    lng = ~Longitude, 
    color = ~color1,  # Use the color column for the markers
    radius = 5,      # Set the size of the circle markers
    stroke = FALSE,  # Remove the stroke (border) around markers
    fillOpacity = 0.8,  # Set the opacity of the fill color
    popup = ~as.factor(Language)  # Display the language when you click on a marker
  ) %>%
  addLegend(
    position = "bottomright", 
    colors = region_colors,  # Display a small sample of colors for the legend
    labels = ordered_regions,  # Display a sample of languages for the legend
    title = "Language World Region"
  )

saveWidget(region.plt, "figures/region.html")