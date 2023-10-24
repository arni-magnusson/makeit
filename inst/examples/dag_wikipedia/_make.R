library(makeit)

make("a.R", prereq=NULL, target="out/a.dat")
make("b.R", prereq="out/a.dat", target="out/b.dat")
make("c.R", prereq="out/a.dat", target="out/c.dat")
make("d.R", prereq=c("out/b.dat", "out/c.dat"), target="out/d.dat")
make("e.R", prereq="out/d.dat", target="out/e.dat")
