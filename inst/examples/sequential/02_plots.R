results <- scan("results.dat", quiet=TRUE)

dir.create("plots", showWarnings=FALSE)

png("plots/A.png", width=1600, height=1200, res=200)
hist(results)
dev.off()

png("plots/B.png", width=1600, height=1200, res=200)
boxplot(results)
dev.off()
