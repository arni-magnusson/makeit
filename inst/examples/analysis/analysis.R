input <- scan("input.dat", quiet=TRUE)

message("Sorting numbers ... estimated run time is 3 seconds")
Sys.sleep(3)
output <- sort(input)

write(output, "output.dat", ncolumn=1)
