#!/usr/bin/env Rscript

# install.packages("pacman", repos = "http://cran.us.r-project.org")
# if (!require("pacman")) install.packages("pacman")
# pacman::p_load(ssh, httr, readr, magrittr, devtools, tidyverse, shiny, shinythemes)
# devtools::install_github(repo = "https://github.com/pepfar-datim/datimutils.git", ref = "master")

require(datimutils)
loginToDATIM(
    username = "admin",
    password = "district",
    base_url = "https://play.dhis2.org/dev/"
    )

smith <- getMetadata(
    "dataElementGroups",
    fields = "id,name,shortName"
    )
# list
print(typeof(smith))

data <- getMetadata(
    end_point = "dimensions",
    "id:eq:gtuVl6NbXQV",
    fields = "items[name,id]"
    )

library(dplyr)
datimutils::getMetadata(
    "dataElementGroups",
    fields = "id,name,shortName"
    ) %>%  dplyr::filter(grepl("ART",`shortName`)) %>%  dplyr::select(name)

