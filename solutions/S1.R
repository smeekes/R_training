# Solutions Session 1

# Exercise 1.7
library(rio)
import("data/climate.csv")

# Exercise 1.8
save.image() # this saves your current workspace

library(quantmod)
# Get Apple Inc. (AAPL) stock data from Yahoo Finance
getSymbols("AAPL", src = "yahoo", from = "2024-01-01", to = "2025-06-13")
# View the data
View(AAPL)
save(AAPL, file = "data/AAPL.RData") # saving a specific object