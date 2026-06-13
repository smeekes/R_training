# Load the data
library(this.path)
setwd(here())
data_grades <- read.table("data/grades.csv", 
                          header = TRUE, sep = ",", stringsAsFactors = FALSE)

# Exercise 4.1
data_sub <- data_grades[, c('ID', 'Name', 'Tutorial',   'Participation_Grade', 'Exam_Score')]
data_sub_4 <- data_sub[data_sub$Tutorial == 4, ]
data_sub_4_exam <- data_sub_4[data_sub_4$Exam_Score > 80, ]
nrow(data_sub_4_exam)
data_sub_4_exam
# Alternatively in one go:
# data_sub[(data_sub$Tutorial == 4) & (data_sub$Exam_Score > 80), ]

# Exercise 4.2
class(data_grades$Tutor)
data_grades$Tutor <- as.factor(data_grades$Tutor)
levels(data_grades$Tutor)

data_grades$Final_Score <- 0.2*data_grades$Participation_Grade + 0.08*data_grades$Exam_Score
# Alternative, once you added the variable Exam_Score_10 to your data set: 
# data_grades$Exam_Score_10 <- data_grades$Exam_Score/10
# data_grades$Final_Score <- 0.2*data_grades$Participation_Grade + 0.8*data_grades$Exam_Score_10

data_2 <- data_grades[data_grades$Tutorial==2, ]
summary(data_2$Final_Score)

min(data_2$Final_Score)
max(data_2$Final_Score)

# Exercise 4.3
library(quantmod)
# Get Apple Inc. (AAPL) stock data from Yahoo Finance
getSymbols("AAPL", src = "yahoo", from = "2024-01-01", to = Sys.Date())
plot(AAPL)
plot(plot(AAPL$AAPL.Close))

# Exercise 4.4
load("data/climate_wide.Rdata")
plot(wide_data$MAASTRICHT, type = 'l', col = 'blue', tck = 0.05,
xlab = "Month", ylab = "Average Temperature")
mean_max <- mean(wide_data$MAASTRICHT)
abline(h = mean_max)

# Exercise 4.5

# Exercise 4.6
library(ggplot2) 
load("data/climate_wide.Rdata")
mean_max <- mean(wide_data$MAASTRICHT)
wide_data$index <- 1:nrow(wide_data)
ggplot(wide_data, aes(x = index, y = MAASTRICHT)) + 
geom_line(color = "steelblue", size = 1) +
geom_point(color = "steelblue") +
geom_hline(yintercept = mean_max, color = "red", linetype = "dashed", size = 1) +
labs(title = "Max temp. in Maastricht",
     x = "Observation Index",
     y = "Max temperature") 



