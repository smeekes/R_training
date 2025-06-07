# Exercise 3.2
x1 <- rnorm(100)
x2 <- rnorm(100, sd = 5)
x3 <- rnorm(100, -6, 4)
mean(x1)
sd(x1)
x1[10] <- NA
mean(x1)
sd(x1)
?mean
?sd
mean(x1, na.rm = TRUE)
sd(x1, na.rm = TRUE)

# Exercise 3.2'
sd(x1, na_rm = TRUE)
mean(x1, na_rm = TRUE)

# Exercise 3.3
load("data/courses.RData")
info_courses <- function(courses, group_size = 15) {
	courses_studtutors <- sum(courses$StudentTutors)
	course_tutorials <- data.frame(code = courses$Code,
																 nr_tutorials = ceiling(courses$Enrollments / 15))
	return(list(nr_courses_studtutors = courses_studtutors, tutorials = course_tutorials))
}
info_courses(courses)

# Exercise 3.4
plot(x1)
x1ts <- ts(x1)
plot(x1ts)
plot(courses$Period)

# Exercise 3.6
library(bootUR)
plot_missing_values(MacroTS)

# Exercise 3.8
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

# Exercise 3.9
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


