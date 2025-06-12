# Purpose: Create example dataset for R training from a larger climate.csv dataset
# Author: Nalan Basturk
# Date of creation: 12 June 2025

rm(list=ls())

# Load main data
library("rio")
data <- import('climate.csv')

# Get a subset of data, 2 cities, 2nd day of the month for 2024
library(dplyr)
subset_data <- data[data$NAME %in% c("MAASTRICHT", "EINDHOVEN") & data$YEAR == 2024 
        & data$DAY == 2, ]
  
# Get some variables instead of the whole list
long_data <- subset_data[, c("NAME", "MONTH", "TEMP")]
cat("--- LONG DATA ---", fill = TRUE)

# Change dataset to wide format
library(tidyr)
wide_data <- long_data %>%
  pivot_wider(
    names_from = NAME,    # what becomes the new column names
    values_from = TEMP   # what fills those columns
  )
cat("--- WIDE DATA ---", fill = TRUE)
print(wide_data)

# Plot data to see what is going on
plot(long_data$MONTH, long_data$TEMP)

# Save dataset as csv file
library("writexl")
write_xlsx(wide_data, "climate_wide.xlsx")

# Save dataset as dta file
library(haven)
save(wide_data, file = "climate_wide.dta")

# Save dataset as Rdata file
save(long_data, file = "climate_long.Rdata")
save(wide_data, file = "climate_wide.Rdata")


# Check if saved datasets can be retreived back
