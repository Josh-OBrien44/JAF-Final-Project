library(readr)
library(lubridate)
library(dplyr)
library(readxl)
library(tidyverse)
library(tidyr)
library(forcats)

rm(list = ls())
setwd("C:/Users/flynn/OneDrive/Desktop/Augie Junior Year/DATA 332-01")

#creating a data frame from the clean cabbage  butterfly data
df_cleanButterfly <- read_excel("FinalProject/Cleaned Data LWA.xlsx", sheet = 1) %>%
  dplyr::rename("coreID" = "core ID", "lwLength" = "LW length", "lwWidth" = "LW width",
                "lwApexA" = "LW apex A", "rwLength" = "RW length", "rwWidth" = "RW width",
                "rwApexA" = "RW apex A")

#calling and mutating only the columns needed from the clean butterfly data frame
df_butterflyBySex <- df_cleanButterfly %>%
  dplyr::select("coreID", "sex", "lwLength", "lwWidth", "rwLength", "rwWidth") %>%
  dplyr::mutate(lwArea = lwLength * lwWidth) %>%
  dplyr::mutate(rwArea = rwLength * rwWidth) %>%
  dplyr::mutate(totalWingArea = lwArea + rwArea)

#omitting all null values
df_tidyButterflyBySex <- na.omit(df_butterflyBySex)

#visualization
df_butterflyWingAreaBySex <- df_tidyButterflyBySex %>%
  dplyr::group_by(sex) %>%
  dplyr::summarise(areaMean = mean(totalWingArea), areaMin = min(totalWingArea),
                   areaMedian = median(totalWingArea), areaMax = max(totalWingArea)) %>%
  tidyr::gather(key = "Function", value = "Value", 2:5) %>%
  tidyr::unite("Sex_Function", sex:Function, remove = FALSE)

wingAreaBySex_chart <- ggplot(df_butterflyWingAreaBySex, 
                                  aes(y=Value, x=forcats::fct_inorder(Sex_Function), 
                                      fill=Sex_Function))+
                                  geom_bar(stat = "identity") + 
                                  xlab("Stats by Sex") + 
                                  ylab("Total Wing Area (mm)") + 
                                  ggtitle("Butterfly Wing Area Stats by Sex") + 
                                  theme(axis.text = element_text(angle = 45, vjust = 1, hjust = 1))
plot(wingAreaBySex_chart)

#T Test
t.test()
