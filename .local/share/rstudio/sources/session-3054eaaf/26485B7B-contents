.PHONY: clean
.PHONY: init

init:
	mkdir -p derived_data
	mkdir -p figures

clean:
	rm -rf derived_data
	rm -rf figures
	mkdir -p derived_data
	mkdir -p figures

derived_data/nyc.csv: source_data/nyc_languages.csv tidy_data.r
	Rscript tidy_data.r

figures/regionggplot.png: derived_data/nyc.csv regionggplot.r
	Rscript regionggplot.r

figures/freq.png: derived_data/nyc.csv freq_plt.r
	Rscript freq_plt.r

derived_data/euroasia.csv: derived_data/nyc.csv euroasia_data.r
	Rscript euroasia_data.r

figures/euroasiapca.png: derived_data/euroasia.csv euroasia_pcaplt.r
	Rscript euroasia_pcaplt.r

figures/euroasiaroc.png: derived_data/euroasia.csv euroasia_rocplt.r
	Rscript euroasia_rocplt.r