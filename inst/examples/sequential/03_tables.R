dir.create("tables", showWarnings=FALSE)

results <- scan("results.dat", quiet=TRUE)

frequency <- data.frame(table(Month=month.abb[results]))
cumulative <- data.frame(Number=results, CumSum=cumsum(results))

write.csv(frequency, file="tables/A.csv", row.names=FALSE, quote=FALSE)
write.csv(cumulative, file="tables/B.csv", row.names=FALSE, quote=FALSE)
