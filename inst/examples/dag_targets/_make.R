library(makeit)

make("first_target.R", NULL, "output/first_target.dat")
make("global_object.R", NULL, "output/global_object.dat")
make("second_target.R",
     prereq=c("output/first_target.dat", "output/global_object.dat",
              "inner_function.R", "outer_function.R"),
     target="output/second_target.dat")
