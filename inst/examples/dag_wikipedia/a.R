dir.create("out", showWarnings=FALSE)

message("Writing out/a.dat")
write(utf8ToInt("a"), "out/a.dat")
