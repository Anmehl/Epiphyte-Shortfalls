# Library required for the Shortfalls script:

# Whenever adding new packages, use "ctrl + shift + C" 
# to uncomment the commented lines so that they are 
# install before being called.  


# Packages names as a character vector
packages <- c("tidyverse", "magrittr", "sf", "spdep",
              "here", "sp", "rnaturalearth", 
              "rnaturalearthdata", "ggplot2", 
              "showtext", "patchwork", "ape", "taxadb", 
              "bdc", "tidyr", "UpSetR", "KnowBR", 
              "vegan", "plotrix", "viridis", "raster",
              'biscale', 'fuzzyjoin', 'openxlsx', 'rworldmap',
              'WorldFlora')


# Install packages not yet installed [for the first time]
installed_packages <- packages %in% rownames(installed.packages())
if (any(installed_packages == FALSE)) {
 install.packages(packages[!installed_packages])
}

# Packages loading
invisible(lapply(packages, require, character.only = TRUE)) # remove "invisible" to see whether the packages are loaded/available. 

# Others:
library(raster,exclude = "select")

data(adworld)


## Functions needed to run the code 

## Utilities 
total <- function(x) { 
  x %>% summarise(n_tot = n()) %>% pull(n_tot) -> n_tot
  return(n_tot)
}

get_mostrecent_year <- function(x){
  x %>% pull(year) %>% .[which.max(.)] -> result
  return(result)
}
roundUp <- function(x,to=10) {to*(x%/%to + as.logical(x%%to))}
font_add_google(name="EB Garamond")
showtext_auto()

