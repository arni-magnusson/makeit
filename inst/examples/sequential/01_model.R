numbers <- scan("data.dat", quiet=TRUE)

results <- sort(numbers)

write(results, "results.dat", ncolumn=1)
