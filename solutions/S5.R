# Load the data
data_grades <- read.table("data/grades.csv", 
													header = TRUE, sep = ",", stringsAsFactors = FALSE)

# # Exercise 5.1
# data_sub <- data_grades[, c('ID', 'Name', 'Tutorial',   'Participation_Grade', 'Exam_Score')]
# data_sub_4 <- data_sub[data_sub$Tutorial == 4, ]
# data_sub_4_exam <- data_sub_4[data_sub_4$Exam_Score > 80, ]
# nrow(data_sub_4_exam)
# data_sub_4_exam
# # Alternatively in one go:
# # data_sub[(data_sub$Tutorial == 4) & (data_sub$Exam_Score > 80), ]
# 
# # Exercise 5.2
# class(data_grades$Tutor)
# data_grades$Tutor <- as.factor(data_grades$Tutor)
# levels(data_grades$Tutor)
# 
# data_grades$Final_Score <- 0.2*data_grades$Participation_Grade + 0.08*data_grades$Exam_Score
# # Alternative, once you added the variable Exam_Score_10 to your data set:
# # data_grades$Exam_Score_10 <- data_grades$Exam_Score/10
# # data_grades$Final_Score <- 0.2*data_grades$Participation_Grade + 0.8*data_grades$Exam_Score_10
# 
# data_2 <- data_grades[data_grades$Tutorial==2, ]
# summary(data_2$Final_Score)
# 
# min(data_2$Final_Score)
# max(data_2$Final_Score)

# Exercise 5.1
data_grades$Final_Score <- 0.2*data_grades$Participation_Grade + 0.08*data_grades$Exam_Score
my_reg1 <- lm(Final_Score ~ Participation_Grade, data = data_grades)
summary(my_reg1)

plot(x = data_grades$Participation_Grade, y = data_grades$Final_Score,
     xlab = 'Participation Grade', ylab = 'Final Score')
abline(my_reg1)

# Make sure you correctly set Tutor to be a factor 
class(data_grades$Tutor)
data_grades$Tutor <- as.factor(data_grades$Tutor)
my_reg2 <- lm(Final_Score ~ Participation_Grade + Tutor, data = data_grades) 
summary(my_reg2)

data_grades$Tutor <- relevel(data_grades$Tutor, ref = 'Chang, Steven')
my_reg3 <- lm(Final_Score ~ Participation_Grade + Tutor, data = data_grades)
summary(my_reg3)

data_grades$Tutor <- relevel(data_grades$Tutor, ref = 'al-Dawood, Haamida')
my_reg4 <- lm(Final_Score ~ Participation_Grade*Tutor, data = data_grades)
summary(my_reg4)

# Exercise 5.2
my_reg5 <- lm(Exam_Score ~ Participation_Grade*Gender, data = data_grades)
summary(my_reg5)
my_tstats <- summary(my_reg5)$coefficients[, 3]; my_tstats
my_grade_info <- summary(my_reg5)$coefficients[2, ]; round(my_grade_info, 2)
my_adjR2 <- summary(my_reg5)$adj.r.squared; my_adjR2
my_resid <- residuals(my_reg5) 
plot(my_resid, xlab = 'Student index', ylab = 'Residuals', col= 'red')
my_fitted <- fitted(my_reg5)
plot(x = data_grades$Exam_Score, y = my_fitted, xlab = 'Exam scores', 
      ylab = 'Fitted values', main = 'Fitted versus Actual')

# Exercise 5.3
load("data/courses.RData")
info_courses <- function(courses, group_size = 15) {
  courses_studtutors <- sum(courses$StudentTutors)
  course_tutorials <- data.frame(code = courses$Code,
                                 nr_tutorials = ceiling(courses$Enrollments / 15))
  return(list(nr_courses_studtutors = courses_studtutors, tutorials = course_tutorials))
}
info_courses(courses)

# Exercise 5.4
if_test <- function(x, y) {
  if (is.numeric(x) && is.character(y)) {
    print("Super")
  } else {
    if (!is.numeric(x)) {
      print("x is not numeric")
    }
    if (!is.character(y)) {
      print("y is not character")
    }
  }
}
# Test cases
if_test(5, "char")      # Should print "Super"
if_test("abc", 2)      # Should print "x is not numeric"
if_test(list(1, 2), matrix("a", 3, 3))  # Should print "x is not numeric"

# Exercise 5.5
impute_missing <- function(x) {
  n <- length(x)
  y <- x
  for (i in 1:n) {
    if (is.na(x[i])) {
      if (i == 1) {
        y[i] <- x[i + 1]
      } else if (i == n) {
        y[i] <- x[i - 1]
      } else {
        y[i] <- (x[i - 1] + x[i + 1]) / 2
      }
    }
  }
  return(y)
}
