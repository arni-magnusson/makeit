library(dplyr, warn.conflicts=FALSE)
library(readr)

get_data <- function(file) {
  read_csv(file, col_types = cols()) %>%
    filter(!is.na(Ozone))
}

dat <- get_data("data_raw.csv")
dir.create("data", showWarnings=FALSE)
write_csv(dat, "data/data.csv")
