library(ggplot2)

plot_model <- function(model, data) {
  ggplot(data) +
    geom_point(aes(x = Temp, y = Ozone)) +
    geom_abline(intercept = model[1], slope = model[2]) +
    theme_gray(24)
}

dat <- read.csv("data/data.csv")
coefs <- scan("output/coefs.dat", quiet=TRUE)

p <- plot_model(coefs, dat)
ggsave("output/plot.pdf", p)
