#' Run R Script if Needed
#'
#' Run an R script if underlying files have changed, otherwise do nothing.
#'
#' @param recipe script filename.
#' @param prereq one or more underlying files, required by the script. For
#'        example, data files and/or scripts.
#' @param target one or more output files, produced by the script. Directory
#'        names can also be used.
#' @param include whether to automatically include the script itself as a
#'        prerequisite file. This means that if the script file has been
#'        modified, it should be run.
#' @param details whether to show a diagnostic table of files and time last
#'        modified.
#' @param force whether to run the R script unconditionally.
#' @param recon whether to return \code{TRUE} or \code{FALSE}, without actually
#'        running the R script.
#' @param silent whether to suppress messages.
#' @param \dots passed to \code{source}.
#'
#' @return \code{TRUE} or \code{FALSE}, indicating whether the script was run.
#'
#' @note
#' This function provides functionality similar to makefile rules, to determine
#' whether a script should be (re)run or not.
#'
#' If any \code{target} is either missing or is older than any \code{prereq},
#' then the script is run.
#'
#' @references
#' Stallman, R. M. \emph{et al.} An introduction to makefiles. Chapter 2 in the
#' \emph{\href{https://www.gnu.org/software/make/manual/}{GNU Make manual}}.
#'
#' @seealso
#' \code{\link{file.exists}} and \code{\link{file.mtime}} are the underlying
#' functions used to check if files are missing or have changed.
#'
#' \code{\link{source}} is the underlying function to run a script.
#'
#' @examples
#' \donttest{
#' # Copy examples 'analysis' and 'sequential' to temporary directory
#' exdir <- tempdir()
#' file.copy(system.file("examples/analysis", package="makeit"),
#'           exdir, recursive=TRUE)
#' file.copy(system.file("examples/sequential", package="makeit"),
#'           exdir, recursive=TRUE)
#' owd <- getwd()
#'
#' # Here, analysis.R uses input.dat, creating output.dat
#' setwd(file.path(exdir, "analysis"))
#' dir()
#' make("analysis.R", "input.dat", "output.dat")  # Running analysis.R
#' dir()
#' make("analysis.R", "input.dat", "output.dat")  # Nothing to be done
#'
#' # Suppress message, show last modified
#' make("analysis.R", "input.dat", "output.dat", silent=TRUE)
#' make("analysis.R", "input.dat", "output.dat", details=TRUE)
#'
#' # Sequential scripts
#' setwd(file.path(exdir, "sequential"))
#' print.simple.list(dir(recursive=TRUE))
#' make("01_model.R", "data.dat", "results.dat")
#' make("02_plots.R", "results.dat", c("plots/A.png", "plots/B.png"))
#' make("03_tables.R", "results.dat", c("tables/A.csv", "tables/B.csv"))
#' print.simple.list(dir(recursive=TRUE))
#'
#' # Clean up
#' unlink(file.path(exdir, c("analysis", "sequential")), recursive=TRUE)
#' setwd(owd)
#' }
#'
#' @aliases makeit
#'
#' @export

make <- function(recipe, prereq, target, include=TRUE, details=FALSE,
                 force=FALSE, recon=FALSE, silent=FALSE, ...)
{
  if(include)
    prereq <- union(prereq, recipe)
  if(details)
    print(data.frame(Object=c(rep("target",length(target)),
                              rep("prereq",length(prereq))),
                     File=c(target,prereq),
                     Modified=file.mtime(c(target,prereq))))
  if(!all(file.exists(prereq)))
    stop("missing prerequisite file '", prereq[!file.exists(prereq)][1], "'")
  if(force ||
     !all(file.exists(target)) ||
     min(file.mtime(target)) < max(file.mtime(prereq)))
  {
    if(!silent)
      message("Running ", recipe)
    if(!recon)
      source(recipe, ...)
    out <- TRUE
  }
  else
  {
    if(!silent)
      message("Nothing to be done")
    out <- FALSE
  }
  invisible(out)
}
