###DATA 332-01 FInal Project Script Library
library(tidyverse)
library(dplyr)
library(readxl)
library(lubridate)
library(readr)

#Setting the working directory
rm(list = ls())
setwd("C:/Users/flynn/OneDrive/Desktop/Augie Junior Year/DATA 332-01")

#Defining the Dataset
df_butterfly <- read_excel("FinalProject/CompletePierisData_2022-03-09.xlsx", sheet = 1) %>%
  
 dplyr::rename("catalogNumber" = "dwc:catalogNumber",
                "institutionCode" = "dwc:institutionCode",
                "Order" = "dwc:order", "Family" = "dwc:family",
                "Genus" = "dwc:genus", "specificEpithet" = "dwc:specificEpithet",
                "scientificName" = "dwc:scientificName",
                "typeStatus" = "dwc:typeStatus", "Sex" = "dwc:sex",
                "eventDate" = "dwc:eventDate", "startDayOfYear" = "dwc:startDayOfYear",
                "endDayOfYear" = "dwc:endDayOfYear", "Day" = "dwc:day",
                "Month" = "dwc:month", "Year" = "dwc:year",
                "verbatimEventDate" = "dwc:verbatimEventDate",
                "higherGeography" = "dwc:higherGeography", "Continent" = "dwc:continent",
                "Island" = "dwc:island", "Country" = "dwc:country",
                "stateProvince" = "dwc:stateProvince", "County" = "dwc:county",
                "Municipality" = "dwc:municipality", "Locality" = "dwc:locality",
                "decimalLatitude" = "dwc:decimalLatitude",
                "decimalLongitude" = "dwc:decimalLongitude",
                "coordinateUncertaintyInMeters" = "dwc:coordinateUncertaintyInMeters") 
  
    
#Number of Butterflies by Institution Visualization  
butterfly_institutions <- df_butterfly %>%
  dplyr::group_by(Institution) %>%
  dplyr::summarise(number = n())
  
  
butterfly_chart <- ggplot(butterfly_institutions, aes(y=number, x=Institution, fill=Institution)) + 
  geom_bar(stat = "identity") +
  xlab("Institution") +
  ylab("Number of Butterflies Found Per Institution") +
  ggtitle("Number of Butterflies Found Per Institution") +
  theme(axis.text = element_text(angle = 45, vjust = 0, hjust = 1))
plot(butterfly_chart)


#T Test on Number of Butterflies Found Per Institution
t.test(butterfly_institutions$number, mu=30)


