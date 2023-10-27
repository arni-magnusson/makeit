a <- scan("out/a.dat", quiet=TRUE)

message("Writing out/c.dat")
write(a + utf8ToInt("c"), "out/c.dat")
