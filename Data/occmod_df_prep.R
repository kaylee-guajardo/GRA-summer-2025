library(tidyverse)
library(unmarked)
library(dplyr)
library(lubridate)

# Read in data
load("call_data_cleaned_2020.Rdata")

# Data overview
summary(call_data_cleaned_2020)

call_data_cleaned_2020 <- call_data_cleaned_2020 %>%
  mutate(Master_Class = as.factor(Master_Class))

call_data_cleaned_2020 %>%
  filter(SiteID == 1599) %>% summary()

# Find max number of nights recorded using install and decom dates
bat_data <- call_data_cleaned_2020 %>%
  mutate(
    Install_Date = as.Date(Installation_Date),
    Decom_Date   = as.Date(Decommission_Date),
    Nights_Recorded = as.numeric(Decom_Date - Install_Date)
  )

summary(bat_data)

bat_data %>% filter(Nights_Recorded == 37) %>% summary()
# Can't do that, quality control issue: decom date does NOT represent day after final survey date for grid cell 2977 sites 2 and 4

bat_data %>%
  group_by(SiteID) %>%
  summarize(max_Sample_Night = max(Sample_Night_int)) %>%
  arrange(desc(max_Sample_Night))
# Max is 8

bat_data %>%
  group_by(SiteID) %>%
  summarize(max_Sample_Night = max(Sample_Night_int)) %>%
  arrange(desc(max_Sample_Night))
# Min is 1 (weird..)
