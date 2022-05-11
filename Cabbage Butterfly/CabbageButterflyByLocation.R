library(readr)
library(lubridate)
library(dplyr)
library(readxl)
library(tidyverse)

rm(list = ls())
setwd("C:/Users/flynn/OneDrive/Desktop/Augie Junior Year/DATA 332-01")

#creating a data frame from the untidy cabbage butterfly data
df_butterfly <- read_excel("FinalProject/CompletePierisData_2022-03-09.xlsx", sheet = 1) %>%
  dplyr::rename("coreID" = "coreid", "catalogNumber" = "dwc:catalogNumber",
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

#Replacement function to make all country variations to USA only
df_butterfly$Country <- str_replace(df_butterfly$Country, "USA", "United States")
df_butterfly$Country <- str_replace(df_butterfly$Country, "U.S.A.", "United States")

#creating a data frame from the clean cabbage  butterfly data
df_cleanButterfly <- read_excel("FinalProject/Cleaned Data LWA.xlsx", sheet = 1) %>%
  dplyr::rename("coreID" = "core ID", "lwLength" = "LW length", "lwWidth" = "LW width",
                "lwApexA" = "LW apex A", "rwLength" = "RW length", "rwWidth" = "RW width",
                "rwApexA" = "RW apex A")

#Selecting only the columns we need from the unclean data
df_butterflyCountryOnly <- df_butterfly %>%
  dplyr::select("coreID", "Country")

#selecting only the columns we need from the clean data
df_cleanButterflyNeeds <- df_cleanButterfly %>%
  dplyr::select("coreID", "lwLength", "lwWidth", "rwLength", "rwWidth")

#join all the needed columns into one data frame
df_butterflyJoined <- df_butterflyCountryOnly %>%
  left_join(df_cleanButterflyNeeds, by = c("coreID")) %>%
  dplyr::mutate(lwArea = lwLength * lwWidth) %>%
  dplyr::mutate(rwArea = rwLength * rwWidth) %>%
  dplyr::mutate(totalWingArea = lwArea + rwArea)

#omit function to get rid of all null values
df_tidyButterflyJoined <- na.omit(df_butterflyJoined)

#Visualization
df_butterflyWingAreaByCountry <- df_tidyButterflyJoined %>%
  dplyr::group_by(Country) %>%
  dplyr::summarise(number = mean(totalWingArea))

wingAreaByCountry_chart <- ggplot(df_butterflyWingAreaByCountry, 
                                  aes(y=number, x=Country, fill=Country))+
  geom_bar(stat = "identity") + 
  xlab("Country") + 
  ylab("Average Total Wing Area (mm)") + 
  ggtitle("Average Total Butterfly Wing Area by Country") + 
  theme(axis.text = element_text(angle = 45, vjust = 0, hjust = 1))
plot(wingAreaByCountry_chart)


#T Test on Average Total Wing Area by Country
t.test(df_butterflyWingAreaByCountry$number, mu=560)
