# This script installs required packages, loads data, and defines utility functions
# for analyzing biodiversity data shortfalls.

# ----------------------------
# Package Installation & Setup
# ----------------------------

# Vector of required packages
packages <- c("tidyverse", "magrittr", "sf", "spdep",
              "here", "sp", "rnaturalearth", 
              "rnaturalearthdata", "showtext", 
              "patchwork", "ape", "taxadb", "bdc",
              "UpSetR", "KnowBR", "vegan", "plotrix", 
              "viridis", "raster", "biscale", "fuzzyjoin", 
              "openxlsx", "rworldmap", "WorldFlora","stars","terra")


# Install missing packages (comment after the first time)
installed_packages <- packages %in% rownames(installed.packages())
if (any(installed_packages == FALSE)) {
  install.packages(packages[!installed_packages])
}

# Load all packages making any message invisible
# (remove the command "invisible" to see if you are missing any package)
invisible(lapply(packages, library, character.only = TRUE))

# Handle raster-dplyr conflicts explicitly
library(raster,exclude = "select")
library(dplyr)  # Ensure dplyr masks raster::select


# Load Latitude and longitude of all administrative areas
data(adworld)

# Configure visual elements
font_add_google(name = "EB Garamond")  # Add custom font for plots
showtext_auto()  # Enable automatic font rendering



# ----------------------------
# Utility Functions
# ----------------------------

#' Calculate total number of records
#' @param x A dataframe/tibble
#' @return Integer count of records
total <- function(x) {
  x %>% 
    summarise(n_tot = n()) %>% 
    pull(n_tot) -> n_tot
  return(n_tot)
}


#' Round values up to specified multiple
#' @param x Numeric vector
#' @param to Multiple to round up to (default=10)
#' @return Rounded values
roundUp <- function(x, to = 10) {
  to*(x %/% to + as.logical(x %% to))
}
