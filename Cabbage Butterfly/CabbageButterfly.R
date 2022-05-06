library(readr)
library(lubridate)
library(dplyr)
library(readxl)
library(tidyverse)

rm(list = ls())
setwd("C:/Users/josho/OneDrive/Documents/DATA332FinalProject/Cabbage Butterfly")

df_butterfly <- read_excel("CompletePierisData_2022-03-09.xlsx", sheet = 1)
df_cleanButterfly <- read_excel("Cleaned Data LWA.xlsx", sheet = 1)
