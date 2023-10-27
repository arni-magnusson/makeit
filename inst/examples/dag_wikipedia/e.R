d <- scan("out/d.dat", quiet=TRUE)

message("Writing out/e.dat")
write(d + utf8ToInt("e"), "out/e.dat")
