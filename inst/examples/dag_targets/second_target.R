source("inner_function.R")
source("outer_function.R")

first_target <- scan("output/first_target.dat", quiet=TRUE)
global_object <- scan("output/global_object.dat", quiet=TRUE)

second_target <- outer_function(first_target) + 2

message("Writing second_target.dat")
write(second_target, "output/second_target.dat")
