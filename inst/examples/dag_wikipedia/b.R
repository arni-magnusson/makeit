a <- scan("out/a.dat", quiet=TRUE)

message("Writing out/b.dat")
write(a + utf8ToInt("b"), "out/b.dat")
