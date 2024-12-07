#611 Project - NYC Languages

In this project, we analyze observational data of languages spoken in New York. We attempt to see if we can predict the world region of a language spoken based on the Longitude and Latitude from which it was observed.

#Table of Contents

Isaac611project
|- derived_data
    |- euroasia.csv
    |- nyc.csv
|- figures
    |- euroasiapca.png
    |- euroasiaroc.png
    |- freq.png
    |- region.png
|- source_data
    |- nyc_languages.csv
|- Dockerfile
|- Makefile
|- README.md
|- euroasia_data.r
|- euroasia_pcaplt.r
|- euroasia_rocplt.r
|- freq_plt.r
|- regionggplot.r
|- report.Rmd
|- tidy_data.r


#How to run

git clone https://github.com/IsaacPan1/Isaac611Project.git

cd Isaac611Project

#build container
docker build -t Isaac611project .

#run on local bash
docker run -it Isaac611project bash

#run on rocker
docker run -it -e PASSWORD=yourpassword -p 8888:8787 -v "$(pwd):/home/rstudio" Isaac611project

#follow makefile to generate


