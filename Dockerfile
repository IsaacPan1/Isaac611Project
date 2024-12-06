# Use the base image from rocker/verse
FROM rocker/verse:latest

# Set environment for R packages
ENV R_LIBS_USER=/home/rstudio/R/library
RUN mkdir -p /home/rstudio/R/library


# Install system dependencies for ggplot
RUN apt-get update && apt-get install -y --no-install-recommends \
    libxml2-dev \
    libcurl4-openssl-dev \
    libssl-dev \
    libfontconfig1-dev \
    libgdal-dev \
    libgeos-dev \
    libproj-dev \
    && rm -rf /var/lib/apt/lists/*


# Install R packages
RUN R -e "install.packages(c( \
    'tidyverse', \
    'ggplot2', \
    'gbm', \
    'pROC'), \
    repos='https://cloud.r-project.org/', dep = T)"

# Set working directory
WORKDIR /home/rstudio/

# Copy project files into the container
COPY . /home/rstudio/
