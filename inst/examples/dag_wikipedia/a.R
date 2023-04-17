cat("Writing out/a.dat\n")
dir.create("out", showWarnings=FALSE)
write(utf8ToInt("a"), "out/a.dat")
