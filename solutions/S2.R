
# Solution to 2.1
norm.vec <- rnorm(50, mean = 0, sd = 1)
mean(norm.vec)
sd(norm.vec)
norm.vec.rep <- rep(norm.vec, each = 10)
mean(norm.vec.rep^2)# first squares elements, then takes mean.
mean(norm.vec.rep)^2# first takes mean, then squares the result.
# Not the same!

# Solution to 2.2
"1" == 1 
# yields TRUE: R coerces "1" to numeric 1.
"1" + 1 
# yields error: cannot add character and numeric.
as.numeric("1") + as.numeric("2") # yields 3
# combine characters and numbers => numbers turn into characters
mix <- c(1, "2")
print(mix)
# now that numbers are converted to characters, numerical operations
# produce an error
mix + 1

# Solution to 2.3
# 1.
row1 <- c(1, 0, 0)
row2 <- c(0, 1, 0)
row3 <- c(0, 0, 1)
I_mat <- rbind(row1, row2, row3)
diag(3)
# 2.
mat <- matrix(c(12.3, 14.7, 27.7, 11.2, 13.5, 15.8), nrow = 3)
rownames(mat) <- c("April", "May", "June")
colnames(mat) <- c("Maastricht", "Eindhoven")
mat
# 3.
mat[c(1, 2),] # include first and second row
mat[-3,] # exclude third row
mat[c("April","May"),]

# Solution to 2.4
ID <- 1:100
income <- rnorm(n = 100, mean = 10, sd = 1)
female <- c(rep(1, 50), rep(0, 50))
my_df <- data.frame(ID, income, female)
my_df
View(my_df)
sub_my_df <- subset(my_df, income > 10)
View(sub_my_df)
