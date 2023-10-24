b <- scan("out/b.dat", quiet=TRUE)
c <- scan("out/c.dat", quiet=TRUE)
cat("Writing out/d.dat\n")
write(b + c + utf8ToInt("d"), "out/d.dat")
