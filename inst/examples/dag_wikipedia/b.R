a <- scan("out/a.dat", quiet=TRUE)
cat("Writing out/b.dat\n")
write(a + utf8ToInt("b"), "out/b.dat")
