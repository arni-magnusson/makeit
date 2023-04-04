[![CRAN Status](https://r-pkg.org/badges/version/makeit)](https://cran.r-project.org/package=makeit)
[![CRAN Monthly](https://cranlogs.r-pkg.org/badges/makeit)](https://cran.r-project.org/package=makeit)
[![CRAN Total](https://cranlogs.r-pkg.org/badges/grand-total/makeit)](https://cran.r-project.org/package=makeit)

makeit
=====

The makeit package provides a simple make-like utility to run R scripts if
needed, based on last modified time.

Installation
------------

The package can be installed from CRAN using the `install.packages` command:

``R
install.packages("makeit")
``

Usage
-----

For a summary of the package:

```R
library(makeit)
?make
```

Development
-----------

The makeit package is developed openly on
[GitHub](https://github.com/arni-magnusson/makeit).

Feel free to open an [issue](https://github.com/arni-magnusson/makeit/issues)
there if you encounter problems or have suggestions for future versions.

The current development version can be installed using:

```R
library(remotes)
install_github("arni-magnusson/makeit")
```
