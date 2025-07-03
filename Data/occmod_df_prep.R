library(tidyverse)
library(unmarked)
library(dplyr)
library(lubridate)

# Read in data
load("call_data_cleaned_2020.Rdata")

## DATA EXPLORATION: IDENTIFY ISSUES -----------------------------------------------------------
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

# New route: use Sample_Night_int
bat_data %>%
  group_by(SiteID) %>%
  summarize(max_Sample_Night = max(Sample_Night_int),
            max_Decom_Install_diff = max(Nights_Recorded)) %>%
  arrange(max_Decom_Install_diff)
# Min total sample nights is 1 (odd) for sites, matches decom install difference

bat_data %>%
  group_by(SiteID) %>%
  summarize(max_Sample_Night = max(Sample_Night_int),
            max_Decom_Install_diff = max(Nights_Recorded)) %>%
  arrange(desc(max_Sample_Night))
# Max total sample nights is 8, but I see 17 listed fpr decom install difference

bat_data %>%
  group_by(SiteID) %>%
  summarize(max_Sample_Night = max(Sample_Night_int),
            max_Decom_Install_diff = max(Nights_Recorded)) %>%
  arrange(desc(max_Decom_Install_diff))
# Many sites seem to have this issue with the decom install difference being significantly larger than number of sample nights
# Will use max sample night to create detection matrix: 
# Matrix will have 8 columns for detection sites 

## SET UP EMPTY DETECTION MATRIX -----------------------------------------------------------
# Add max sampling night to each observation
max_night_by_SiteID <- bat_data %>%
  group_by(SiteID) %>%
  summarize(max_Sample_Night = max(Sample_Night_int))

max_night_by_SiteID %>% distinct(SiteID) %>% count()

bat_data <- bat_data %>%
  left_join(max_night_by_SiteID, by = "SiteID")

# Find total number of surveyed sites
bat_data %>%
  distinct(SiteID) %>% count()
# 331 total sites sampled

# Make empty detection matrix: 331 rows (sites) x 8 columns (max potential sampling nights)
empty_det_matrix <- matrix(data = NA, 
       nrow = 331, 
       ncol = 8)

empty_det_df <- as.data.frame(empty_det_matrix) %>%
  rename(night1 = V1,
         night2 = V2,
         night3 = V3,
         night4 = V4,
         night5 = V5,
         night6 = V6,
         night7 = V7,
         night8 = V8)

sites_det_df <- cbind(max_night_by_SiteID, empty_det_df)

## POSITIVE DETECTIONS -----------------------------------------------------------
# Filter data to only have Hand_Class as D or P
bat_data_DP <- bat_data %>%
  filter(Hand_Class %in% c("D", "P"))

# Create new df with only Hand_Class = D
bat_data_D <- bat_data %>%
  filter(Hand_Class == "D")

bat_data_D %>%
  group_by(Master_Class) %>%
  count() %>%
  arrange(desc(n))
# Laci bat species has most number of definitive detection (656)
# Followed by Lano with 582
# Then Mylu with 534
# Steep drop off from there - Myev with 175, sub 100 after that

# Confirming that sites did not have more than one sampling period in 2020 using installation date
bat_data_D %>%
  group_by(SiteID, Installation_Date) %>% 
  distinct(Installation_Date) %>%
  count(SiteID) %>% filter(n > 1)
# True for all species with detection of Hand_Class D

# Find sites and their sample nights where Laci was detected
Laci_det_nights <- bat_data_D %>%
  filter(Master_Class == "Laci") %>%
  group_by(SiteID, max_Sample_Night) %>% 
  distinct(Sample_Night_int)


## FILL IN DETECTION DF -----------------------------------------------------------
# Data frames to use: sites_det_df & Laci_det_nights
for (i in 1:nrow(sites_det_df)) {
  
  site <- sites_det_df$SiteID[i] # for site i
  
  positive_det_nights <- Laci_det_nights %>%
    filter(SiteID == site) %>%
    pull(Sample_Night_int)
  
  # Night 1
  if (1 <= sites_det_df$max_Sample_Night[i]) {
  sites_det_df$night1[i] <- ifelse(1 %in% positive_det_nights, 1, 0)
} else {sites_det_df$night1[i] <- NA}

  # Night 2
  if (2 <= sites_det_df$max_Sample_Night[i]) {
    sites_det_df$night2[i] <- ifelse(2 %in% positive_det_nights, 1, 0)
  } else {sites_det_df$night2[i] <- NA}

  # Night 3
  if (3 <= sites_det_df$max_Sample_Night[i]) {
    sites_det_df$night3[i] <- ifelse(3 %in% positive_det_nights, 1, 0)
  } else {sites_det_df$night3[i] <- NA}
  
  # Night 4
  if (4 <= sites_det_df$max_Sample_Night[i]) {
    sites_det_df$night4[i] <- ifelse(4 %in% positive_det_nights, 1, 0)
  } else {sites_det_df$night4[i] <- NA}
  
  # Night 5
  if (5 <= sites_det_df$max_Sample_Night[i]) {
    sites_det_df$night5[i] <- ifelse(5 %in% positive_det_nights, 1, 0)
  } else {sites_det_df$night5[i] <- NA}
  
  # Night 6
  if (6 <= sites_det_df$max_Sample_Night[i]) {
    sites_det_df$night6[i] <- ifelse(6 %in% positive_det_nights, 1, 0)
  } else {sites_det_df$night6[i] <- NA}
  
  # Night 7
  if (7 <= sites_det_df$max_Sample_Night[i]) {
    sites_det_df$night7[i] <- ifelse(7 %in% positive_det_nights, 1, 0)
  } else {sites_det_df$night7[i] <- NA}
  
  # Night 8
  if (8 <= sites_det_df$max_Sample_Night[i]) {
    sites_det_df$night8[i] <- ifelse(8 %in% positive_det_nights, 1, 0)
  } else {sites_det_df$night8[i] <- NA}
  
}

# Check that it worked
sites_det_df %>% filter(SiteID == 1563)
Laci_det_nights %>% filter(SiteID == 1563)
# works

sites_det_df %>% filter(SiteID == 1571)
Laci_det_nights %>% filter(SiteID == 1571)
# works

## PULL DETECTION MATRIX FROM DF -----------------------------------------------------------
detection_matrix <- sites_det_df %>%
  select(night1:night8) %>%
  as.matrix()

## WRITE DET MATRIC FUNCTION FOR ANY SPECIES -----------------------------------------------------------

#detection_matrix <- function(data, species){
  #data %>%
    #filter(Master_Class == species) %>%
    
#}
  
  
  
  