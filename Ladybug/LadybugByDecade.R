library(tidyverse)
library(dplyr)
library(readxl)
library(lubridate)
library(readr)

rm(list = ls())
setwd("C:/Users/flynn/OneDrive/Desktop/Augie Junior Year/DATA 332-01")


df_ladybug <- read_excel("FinalProject/Ladybug Data.xlsx", sheet = 1)
df_scanladybug <- read_excel("FinalProject/Scan Ladybug Data.xlsx", sheet = 1)

#creating a joined data frame from the two excel files
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

#cleaning the data (mainly renaming)
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
df_scan_ladybug$Species <- str_replace(df_scan_ladybug$Species, "Propylea quatuordecimpuncata", "Propylea quatuordecimpunctata")
df_scan_ladybug$Species <- str_replace(df_scan_ladybug$Species, "Harmonia axyrisis", "Harmonia axyridis")
df_scan_ladybug$Species <- str_replace(df_scan_ladybug$Species, "harmonia axyridis", "Harmonia axyridis")
df_scan_ladybug$Species <- str_replace(df_scan_ladybug$Species, "harmonia axyrids", "Harmonia axyridis")
df_scan_ladybug$Species <- str_replace(df_scan_ladybug$Species, "Harminia axyridis", "Harmonia axyridis")
df_scan_ladybug$Species <- str_replace(df_scan_ladybug$Species, "Colemegilla maculata", "Coleomegilla maculata")
df_scan_ladybug$Species <- str_replace(df_scan_ladybug$Species, "coleomegilla maculata", "Coleomegilla maculata")
df_scan_ladybug$Species <- str_replace(df_scan_ladybug$Species, "Cycloneda munda", "Cycloneda Munda")
df_scan_ladybug$Species <- str_replace(df_scan_ladybug$Species, "cycloneda munda", "Cycloneda Munda")
df_scan_ladybug$Species <- str_replace(df_scan_ladybug$Species, "coccinella septempunctata", "Coccinella Septempunctata")
df_scan_ladybug$Species <- str_replace(df_scan_ladybug$Species, "Coccinella septempunctata", "Coccinella Septempunctata")
df_scan_ladybug$Species <- str_replace(df_scan_ladybug$Species, "hippodamia parenthesis", "Hippodamia parenthesis")
df_scan_ladybug$Species <- str_replace(df_scan_ladybug$Species, "Hippodamia covergence", "Hippodamia convergens")
df_scan_ladybug$Species <- str_replace(df_scan_ladybug$Species, "hippodamia convergens", "Hippodamia convergens")
df_scan_ladybug$Species <- str_replace(df_scan_ladybug$Species, "Coccinella septempunctata", "Coccinella Septempunctata")

#changing and then grouping all of the years to decades
df_scan_ladybug$decade <- substr(df_scan_ladybug$year, 1, 3)
df_scan_ladybug$decade <- paste0(df_scan_ladybug$decade, "0's")

#Visualization
df_ladybugByDecade <- df_scan_ladybug %>%
  dplyr::filter(decade != "NA0's") %>%
  dplyr::filter(decade != "2020's") %>%
  dplyr::group_by(decade) %>%
  dplyr::summarise(number = n())

ladybugsByDecade_chart <- ggplot(df_ladybugByDecade, aes(x=decade, y=number,
                                                         fill=decade))+
  geom_bar(stat = "identity") + 
  xlab("Decade") + 
  ylab("Number of Ladybugs") + 
  ggtitle("Number of Ladybugs Discovered by Decade") + 
  theme(axis.text = element_text(angle = 45, vjust = 1, hjust = 1))
plot(ladybugsByDecade_chart)

