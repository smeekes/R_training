
# Solution to 4.1
save.image('myoutput.Rdata')
save(climate, 'myclimatedata.Rdata')
myoutput <- list(data_short$NAME, data_short$LATITUTE)
save(myoutput, 'myclimatedata.Rdata')

# Solution to 4.2
library(quantmod)
# Get Apple Inc. (AAPL) stock data from Yahoo Finance
getSymbols("AAPL", src = "yahoo", from = "2024-01-01", to = Sys.Date())
plot(AAPL)
plot(plot(AAPL$AAPL.Close))

# Solution to 4.3
load("data/climate_wide.Rdata")
plot(wide_data$MAASTRICHT, type = 'l', col = 'blue', tck = 0.05,
xlab = "Month", ylab = "Average Temperature")
mean_max <- mean(wide_data$MAASTRICHT)
abline(h = mean_max)

# Solution to 4.4
library(ggplot2) 
load("data/climate_wide.Rdata")
mean_max <- mean(wide_data$MAASTRICHT)
wide_data$index <- 1:nrow(wide_data)
ggplot(wide_data, aes(x = index, y = MAASTRICHT)) + 
geom_line(color = "steelblue", size = 1) +
geom_point(color = "steelblue") +
geom_hline(yintercept = mean_max, color = "red", linetype = "dashed", size = 1) 
labs(title = "Max temp. in Maastricht",
     x = "Observation Index",
     y = "Max temperature") 



