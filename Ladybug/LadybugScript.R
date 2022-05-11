###DATA 332-01 FInal Project Script Library
library(tidyverse)
library(dplyr)
library(readxl)
library(lubridate)
library(readr)

rm(list = ls())
setwd("/Users/aj/Desktop/data brosius")


df_ladybug <- read_excel("Ladybug Data.xlsx", sheet = 1)
df_scanladybug <- read_excel("Scan Ladybug Data.xlsx", sheet = 1)

colnames(df_scanladybug)
df_scan_ladybug <- df_scanladybug %>%
  dplyr::select("catalogNumber","id","institutionCode", "collectionCode", "collectionID", 
                "basisOfRecord", "occurrenceID", "catalogNumber",
                "kingdom", "phylum", "class", "order", "family", 
                "scientificName", "taxonID", "scientificNameAuthorship", "genus", 
                "specificEpithet", "infraspecificEpithet", "identifiedBy", 
                "dateIdentified", "typeStatus", "recordedBy", 
                "recordNumber", "eventDate", "year", "month", "day", "startDayOfYear", 
                "endDayOfYear", "verbatimEventDate", "country", "stateProvince",
                "county", "municipality", "locality", "recordEnteredBy", "modified",
                "rights", "rightsHolder", "recordId", "references") %>%
  dplyr::rename("SCAN CODE" = "catalogNumber") %>%
  left_join(df_ladybug, by = c("SCAN CODE")) %>%
  

  dplyr::select("SCAN CODE","Species", "collector", "country", "county",
                "stateProvince", "year", "genus", "kingdom", "order", "family", 
                "class", "phylum", "specificEpithet")
View(df_scan_ladybug)

#NUMBER OF SPECIES FOUND/ COUNT
counts <- table(df_scan_ladybug$Species)
barplot(counts, main="Species Distribution",
        xlab="Number of species")



