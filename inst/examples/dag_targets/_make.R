library(makeit)

make("first_target.R", NULL, "out/first_target.dat")
make("global_object.R", NULL, "out/global_object.dat")
source("inner_function.R")
source("outer_function.R")
make("second_target.R",
     prereq=c("out/first_target.dat", "out/global_object.dat",
              "inner_function.R", "outer_function.R"),
     target="out/second_target.dat")
