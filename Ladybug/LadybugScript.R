###DATA 332-01 FInal Project Script Library
library(tidyverse)
library(dplyr)
library(readxl)
library(lubridate)
library(readr)

rm(list = ls())
setwd("C:/Users/flynn/OneDrive/Desktop/Augie Junior Year/DATA 332-01")


df_ladybug <- read_excel("FinalProject/Ladybug Data.xlsx", sheet = 1)
df_scanladybug <- read_excel("FinalProject/Scan Ladybug Data.xlsx", sheet = 1)