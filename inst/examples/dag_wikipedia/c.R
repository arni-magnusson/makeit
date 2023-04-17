a <- scan("out/a.dat", quiet=TRUE)
cat("Writing out/c.dat\n")
write(a + utf8ToInt("c"), "out/c.dat")
