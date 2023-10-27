b <- scan("out/b.dat", quiet=TRUE)
c <- scan("out/c.dat", quiet=TRUE)

message("Writing out/d.dat")
write(b + c + utf8ToInt("d"), "out/d.dat")
