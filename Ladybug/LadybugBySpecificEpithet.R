###DATA 332-01 FInal Project Script Library
library(tidyverse)
library(dplyr)
library(readxl)
library(lubridate)
library(readr)

#Set working directory
rm(list = ls())
setwd("C:/Users/flynn/OneDrive/Desktop/Augie Junior Year/DATA 332-01")

##Defining dataframe
df_ladybug <- read_excel("FinalProject/Ladybug Data.xlsx", sheet = 1)
df_scanladybug <- read_excel("FinalProject/Scan Ladybug Data.xlsx", sheet = 1)

#Changing column names and narrowing down dataset
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

#omit function to get rid of all null values
df_scan_ladybug <- na.omit(df_scan_ladybug)



#Creating new dataframe with only necessary data
ladybug_epithet <- df_scan_ladybug %>%
  dplyr::group_by(specificEpithet) %>%
  dplyr::summarise(number = n())


#Data Visualizations
ladybug_epithet_chart <- ggplot(ladybug_epithet, aes(y=number, x=specificEpithet, fill=specificEpithet)) + 
  geom_bar(stat = "identity") +
  xlab("specificEpithet") +
  ylab("Number of Ladybug Species Found") +
  ggtitle("Number of Ladybugs Found by Each Specific Epithet") +
  theme(axis.text = element_text(angle = 45, vjust = 0, hjust = 1))
plot(ladybug_epithet_chart)


#T Test
t.test(ladybug_epithet$number, mu=10)


