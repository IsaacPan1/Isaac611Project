#611 Project - NYC Languages


## Project Overview
In this project, we analyze observational data of languages spoken in New York. We attempt to see if we can predict the world region of a language spoken based on the Longitude and Latitude from which it was observed.

---

## Table of Contents

```plaintext
Isaac611project/
├── derived_data/          # Processed data files
│   ├── euroasia.csv       # Filtered data to just Europe and Asia World Regions
│   ├── nyc.csv            # Cleaned dataset
├── figures/               # Generated plots and figures
│   ├── euroasiapca.png    # PCA plot for Euroasia data
│   ├── euroasiaroc.png    # ROC curve for Euroasia data
│   ├── freq.png           # World Region Frequency plot
│   ├── region.png         # NYC Regional comparison plot
├── source_data/           # Raw data files
│   ├── nyc_languages.csv  # Original dataset for NYC language analysis
├── Dockerfile             # Docker configuration file
├── Makefile               # Makefile with data/figures in order of generation
├── README.md              # Project documentation
├── euroasia_data.r        # Script to prepare Euroasia data
├── euroasia_pcaplt.r      # Script to generate PCA plot for Euroasia
├── euroasia_rocplt.r      # Script to generate ROC curve for Euroasia
├── freq_plt.r             # Script to generate frequency plot
├── regionggplot.r         # Script for World Region plot
├── report.Rmd             # R Markdown file for generating project report
├── tidy_data.r            # Script to clean original dataset
```

## How to run

```bash
git clone https://github.com/IsaacPan1/Isaac611Project.git
cd Isaac611Project

#build container
docker build -t Isaac611project .

#run on local bash
docker run -it Isaac611project bash

#run on rocker
docker run -it -e PASSWORD=yourpassword -p 8888:8787 -v "$(pwd):/home/rstudio" Isaac611project

#follow makefile to generate
```
