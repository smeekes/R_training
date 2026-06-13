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
plot(x1)
x1ts <- ts(x1)
plot(x1ts)
load("data/courses.RData")
plot(courses$Period)

# Exercise 3.5
library(bootUR)
plot_missing_values(MacroTS)




