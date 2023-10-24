d <- scan("out/d.dat", quiet=TRUE)
cat("Writing out/e.dat\n")
write(d + utf8ToInt("e"), "out/e.dat")
