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



# Exercise 3.4
plot(x1)
x1ts <- ts(x1)
plot(x1ts)
plot(courses$Period)

# Exercise 3.6
library(bootUR)
plot_missing_values(MacroTS)




