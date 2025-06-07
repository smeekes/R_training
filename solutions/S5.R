# Load the data
data_grades <- read.table("grades.csv", 
													header = TRUE, sep = ",", stringsAsFactors = FALSE)

# Exercise 5.1
data_sub <- data_grades[, c('ID', 'Name', 'Tutorial',   'Participation_Grade', 'Exam_Score')]
data_sub_4 <- data_sub[data_sub$Tutorial == 4, ]
data_sub_4_exam <- data_sub_4[data_sub_4$Exam_Score > 80, ]
nrow(data_sub_4_exam)
data_sub_4_exam

# Exercise 5.2
class(data_grades$Tutor)
data_grades$Tutor <- as.factor(data_grades$Tutor)
levels(data_grades$Tutor)

data_grades$Final_Score <- 0.2*data_grades$Participation_Grade + 0.08*data_grades$Exam_Score
#or
data_grades$Final_Score <- 0.2*data_grades$Participation_Grade + 0.8*data_grades$Exam_Score_10

data_2 <- data_grades[data_grades$Tutorial==2, ]
summary(data_2$Final_Score)

min(data_2$Final_Score)
max(data_2$Final_Score)