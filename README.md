# EpiExploR
Hello world! Hang in there!

Here we present EpiExploR. A small shiny based R packages, which makes R interactive and more user friendly. The package is trying to help researchers working on any **Epigenomics based data**, which are not super happy about coding at all. Within this packages it is possible to get an overview of data.

## Introduction to dependencies

The only thing you need is some data in .csv and a output from Bismark (.cov.gz).

See examples below.


## Main Features in EpiExploR

This package is mainly combining already established methods from really nice packages like _animalcules_, _lmerTest_ and _boral_. I am only trying to provide a more user-friendly approach. These packages should be fully credited for their amazing work!

• Uploading of your data

• Getting an overview of your data and metadata


## Installation

This packages requires quite some packages to run, since it is a rather extensive framework. Installing them can be a bugger.
Installation of this package will require R Version >4.1.0.

First you have to download JAGS for bayesian modelling, because BORAL and rjags is depedent on this. Please find a MAC and WINDOWS solution below.

**MAC**
https://sourceforge.net/projects/mcmc-jags/

**WINDOWS**
https://sourceforge.net/projects/mcmc-jags/files/JAGS/4.x/Windows/

It can be a good idea to start with this line, fist :)


```{r Installation of dependencies, include = FALSE}   
dependencies <- c("devtools","BiocManager","shiny","shinyjs",
                  "MultiAssayExperiment","ggplot2","plotly",
                  "vegan","dplyr","magrittr","biomformat",
                  "shinythemes","RColorBrewer","decontam",
                  "animalcules","limma", "broom.mixed", "lmerTest", "performance", "gt", "gtExtras","boral","ggboral", "tidyverse", "pbkrtest", "ggiraph", "hilldiv","sva","factoextra", "phyloseq", "ape")


# Install packages not yet installed
#CRAN
installed_packages <- dependencies %in% rownames(installed.packages())
if (any(installed_packages == FALSE)) {
  install.packages(dependencies[!installed_packages])}
#BiocManager
installed_packages <- dependencies %in% rownames(installed.packages())
if (any(installed_packages == FALSE)) {
BiocManager::install(dependencies[!installed_packages])}
#Github
installed_packages <- dependencies %in% rownames(installed.packages())
if (installed_packages[21] == FALSE) {
  remotes::install_github("jthomasmock/gtExtras")}
installed_packages <- dependencies %in% rownames(installed.packages())
if (installed_packages[23] == FALSE) {
  remotes::install_github("mbedward/ggboral")}
```
Now if all went smooth, you should be golden!

```{r Installation, include = FALSE}
# Install devtools from CRAN
install.packages("devtools")

# Or the development version from GitHub:
# install.packages("devtools")
devtools::install_github("JacobAgerbo/QuickFixR")
```

## Running Shiny
After installation, which hopefully should be the most difficult part, then you can run a simple commmand to start of the interactive part.
```{r Run QuickFixR, include = FALSE}
QuickFixR::QuickFix()
```

## What is next?

I am planning to incorporate more features in the following nearest future, which includes

• Generalised Linear Models

• Biomarker Prediction

• Batch Correction of data

• Normalisation, like quantile Norm, VSN, etc.

• Clustering, like KNN, PAM, and HCLUST

Please enjoy :)
