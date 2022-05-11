##DATA 332-01 FInal Project Script Library
library(tidyverse)
library(dplyr)
library(readxl)
library(lubridate)
library(readr)

rm(list = ls())
setwd("C:/Users/flynn/OneDrive/Desktop/Augie Junior Year/DATA 332-01")


df_ladybug <- read_excel("FinalProject/Ladybug Data.xlsx", sheet = 1)
df_scanladybug <- read_excel("FinalProject/Scan Ladybug Data.xlsx", sheet = 1)

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

unique(df_scan_ladybug$collector)

df_scan_ladybug$collector <- str_replace(df_scan_ladybug$collector, "J Hughes", "J. Hughes")
df_scan_ladybug$collector <- str_replace(df_scan_ladybug$collector, "Jack Hughes", "J. Hughes")
df_scan_ladybug$collector <- str_replace(df_scan_ladybug$collector, "j. Hughes", "J. Hughes")
df_scan_ladybug$collector <- str_replace(df_scan_ladybug$collector, "J. hughes", "J. Hughes")
df_scan_ladybug$collector <- str_replace(df_scan_ladybug$collector, "jack hughes", "J. Hughes")
df_scan_ladybug$collector <- str_replace(df_scan_ladybug$collector, "J. Hughees", "J. Hughes")
df_scan_ladybug$collector <- str_replace(df_scan_ladybug$collector, "j. hughes", "J. Hughes")
df_scan_ladybug$collector <- str_replace(df_scan_ladybug$collector, "Olivia Ruffatto", "O. Ruffatto")
df_scan_ladybug$collector <- str_replace(df_scan_ladybug$collector, "O. ruffatto", "O. Ruffatto")
df_scan_ladybug$collector <- str_replace(df_scan_ladybug$collector, "o. Ruffatto", "O. Ruffatto")
df_scan_ladybug$collector <- str_replace(df_scan_ladybug$collector, "Olivia ruffatto", "O. Ruffatto")
df_scan_ladybug$collector <- str_replace(df_scan_ladybug$collector, "o. ruffattto", "O. Ruffatto")
df_scan_ladybug$collector <- str_replace(df_scan_ladybug$collector, "o. ruffatto", "O. Ruffatto")
df_scan_ladybug$collector <- str_replace(df_scan_ladybug$collector, "OliviaRuffatto", "O. Ruffatto")
df_scan_ladybug$collector <- str_replace(df_scan_ladybug$collector, "m gorsegner", "M. Gorsegner")
df_scan_ladybug$collector <- str_replace(df_scan_ladybug$collector, "m. gorsegner", "M. Gorsegner")
df_scan_ladybug$collector <- str_replace(df_scan_ladybug$collector, "M.Gorsegner", "M. Gorsegner")
df_scan_ladybug$collector <- str_replace(df_scan_ladybug$collector, "Marissa Gorsegner", "M. Gorsegner")
df_scan_ladybug$collector <- str_replace(df_scan_ladybug$collector, "M. gorsegner", "M. Gorsegner")
df_scan_ladybug$collector <- str_replace(df_scan_ladybug$collector, "v. cervantes", "V. cervantes")
df_scan_ladybug$collector <- str_replace(df_scan_ladybug$collector, "Veronica Cervatnes", "V. cervantes")
df_scan_ladybug$collector <- str_replace(df_scan_ladybug$collector, "Veronica Cervantes", "V. cervantes")
df_scan_ladybug$collector <- str_replace(df_scan_ladybug$collector, "V. Cervantes", "V. cervantes")
df_scan_ladybug$collector <- str_replace(df_scan_ladybug$collector, "V. cervantes", "V. cervantes")
df_scan_ladybug$collector <- str_replace(df_scan_ladybug$collector, "V.Cervantes", "V. cervantes")
df_scan_ladybug$collector <- str_replace(df_scan_ladybug$collector, "v cervantes", "V. cervantes")
 
unique(df_scan_ladybug$Species)
df_scan_ladybug$collector <- str_replace(df_scan_ladybug$collector, "Propylea quatuordecimpuncata", "Propylea quatuordecimpunctata")
df_scan_ladybug$collector <- str_replace(df_scan_ladybug$collector, "Harmonia axyrisis", "Harmonia axyridis")
df_scan_ladybug$collector <- str_replace(df_scan_ladybug$collector, "harmonia axyridis", "Harmonia axyridis")
df_scan_ladybug$collector <- str_replace(df_scan_ladybug$collector, "harmonia axyrids", "Harmonia axyridis")
df_scan_ladybug$collector <- str_replace(df_scan_ladybug$collector, "Harminia axyridis", "Harmonia axyridis")
df_scan_ladybug$collector <- str_replace(df_scan_ladybug$collector, "Colemegilla maculata", "Coleomegilla maculata")
df_scan_ladybug$collector <- str_replace(df_scan_ladybug$collector, "coleomegilla maculata", "Coleomegilla maculata")
df_scan_ladybug$collector <- str_replace(df_scan_ladybug$collector, "Cycloneda munda", "Cycloneda Munda")
df_scan_ladybug$collector <- str_replace(df_scan_ladybug$collector, "cycloneda munda", "Cycloneda Munda")
df_scan_ladybug$collector <- str_replace(df_scan_ladybug$collector, "coccinella septempunctata", "Coccinella Septempunctata")
df_scan_ladybug$collector <- str_replace(df_scan_ladybug$collector, "Coccinella septempunctata", "Coccinella Septempunctata")
df_scan_ladybug$collector <- str_replace(df_scan_ladybug$collector, "hippodamia parenthesis", "Hippodamia parenthesis")
df_scan_ladybug$collector <- str_replace(df_scan_ladybug$collector, "Hippodamia covergence", "Hippodamia convergens")
df_scan_ladybug$collector <- str_replace(df_scan_ladybug$collector, "hippodamia convergens", "Hippodamia convergens")
df_scan_ladybug$collector <- str_replace(df_scan_ladybug$collector, "Coccinella septempunctata", "Coccinella Septempunctata")


#omit function to get rid of all null values
df_scan_ladybug <- na.omit(df_scan_ladybug)


#species hippodamia parenthesis by state
#stacked barplot
counts <- table(df_scan_ladybug$collector, df_scan_ladybug$Species)
barplot(counts, main="Species by Collector",
        xlab="Name of Species", ylab="Number of Species", col=c("darkblue","red", "green", "orange"),
        legend = rownames(counts))


