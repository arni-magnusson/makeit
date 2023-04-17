library(makeit)

make("get_data.R", "data_raw.csv", "data/data.csv")
make("fit_model.R", "data/data.csv", "output/coefs.dat")
make("plot_model.R", c("data/data.csv", "output/coefs.dat"), "output/plot.pdf")
