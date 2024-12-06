library(tidyverse)
library(ggplot2)

s <- read.csv("derived_data/euroasia.csv") 

# Select only the relevant columns for PCA
pca_prep <- s %>% select(Latitude, Longitude)

# Apply PCA on the selected columns
pca <- prcomp(pca_prep, center = TRUE, scale. = TRUE)  # It's a good idea to center and scale data

# Convert the PCA result into a data frame
pca.data <- as.data.frame(pca$x)

# Add the 'World.Region' label to the PCA result for plotting
pca.data$label <- s$class

# Plot the first two principal components with coloring by 'World.Region'
pca <- ggplot(pca.data, aes(x = PC1, y = PC2, color = as.factor(label))) + geom_point() + labs(color = "World Region", )

ggsave("figures/euroasiapca.png", plot = pca, width = 8, height = 6)