#' straf: STR Analysis for Forensics
#'
#' straf is a Shiny application to perform Short Tandem Repeats (STRs, also 
#' known as microsatellites) data analysis. The application allows one to 
#' compute forensic parameters, population genetics indices, and investigate 
#' population structure through various methods and generate relevant data 
#' visualisations. It also implements file conversion to other popular formats.
#' 
#' @section Running the app:
#' One simply needs to call the runStraf() function to start the application.
#'
#' @docType package
#' @name straf
#' @rawNamespace import(shiny, except = c(dataTableOutput, renderDataTable))
#' @importFrom ade4 dudi.pca
#' @importFrom adegenet as.genind df2genind pop<- locNames genind2genpop transp funky dist.genpop loadingplot makefreq pop
#' @importClassesFrom adegenet genind
#' @importFrom colourpicker colourInput
#' @importFrom DT dataTableOutput renderDataTable datatable
#' @importFrom ggplot2 ggplot geom_point labs theme_minimal aes
#' @importFrom ggrepel geom_text_repel
#' @importFrom graphics abline axis barplot hist image legend par
#' @importFrom hierfstat pairwise.WCfst genind2hierfstat
#' @importFrom magrittr "%>%"
#' @importFrom openxlsx write.xlsx
#' @importFrom pegas LD LD2 genind2loci hw.test
#' @importFrom reshape2 acast
#' @importFrom shinyWidgets awesomeCheckbox pickerInput
#' @importFrom stats as.dist cmdscale cov frequency ks.test qqplot qunif
#' @importFrom tidyr gather
#' @importFrom utils read.table write.table
NULL
#> NULL