#package version
VERSION <- "v1.0.0"

#check if required packages is installed
#list of packages required
required_packages <- c("shiny", "shinydashboard", "shinyjs", "shinyalert", "shinycssloaders", "DESeq2", "metaRNASeq", "dplyr", "ggplot2", "ggrepel", "ggvenn", "ComplexHeatmap", "pheatmap", "EnhancedVolcano", "DT", "rbioapi", "clusterProfiler", "heatmaply", "gridExtra")

#checking missing packages from list
new_packages <- required_packages[!(required_packages %in% installed.packages()[,"Package"])]

#install missing ones from CRAN
if(length(new_packages)) install.packages(new_packages, dependencies = TRUE)
#install missing ones from BioConductor
#check if BiocManager exists
if (!require("BiocManager", quietly = TRUE))
  install.packages("BiocManager")
if(length(new_packages)) BiocManager::install(new_packages, dependencies = TRUE)

#load required packages
lapply(required_packages, function(x) {
  suppressPackageStartupMessages(suppressMessages(require(x, character.only = T, quietly = T, warn.conflicts = F)))
})