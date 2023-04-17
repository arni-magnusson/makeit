library(makeit)

make("01_model.R", "data.dat", "results.dat")
make("02_plots.R", "results.dat", c("plots/A.png", "plots/B.png"))
make("03_tables.R", "results.dat", c("tables/A.csv", "tables/B.csv"))
