cat("Writing second_target.dat\n")
first_target <- scan("output/first_target.dat", quiet=TRUE)
source("inner_function.R")
source("outer_function.R")
second_target <- outer_function(first_target) + 2
write(second_target, "output/second_target.dat")
