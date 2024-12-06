#use nyc_map to create this data
library(tidyverse)
library(ggplot2)

nyc_map <- read.csv("derived_data/nyc.csv", stringsAsFactors = FALSE)

#sort the by frequency
freq_nyc <- nyc_map %>% group_by(World.Region) %>% tally() %>% arrange(desc(n)) %>% mutate(World.Region = factor(World.Region, World.Region)) %>% mutate(rank=1:nrow(.))

#plot
freq_plt <- ggplot(freq_nyc, aes(rank, n)) + geom_segment(aes(x=rank, xend=rank, y=0, yend=n)) + theme_minimal() + geom_text(aes(label = World.Region, y = n+20), angle = -90, size = 2)

ggsave("figures/freq.png", plot = freq_plt, width = 8, height = 6)