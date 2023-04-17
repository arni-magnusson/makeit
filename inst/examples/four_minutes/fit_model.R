library(dplyr)

fit_model <- function(data) {
  lm(Ozone ~ Temp, data) %>%
    coefficients()
}

dir.create("output", showWarnings=FALSE)
dat <- read.csv("data/data.csv")
coefs <- fit_model(dat)
write(coefs, "output/coefs.dat")
