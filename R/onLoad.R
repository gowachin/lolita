#' @import yaml
.onLoad <- function(libname, pkgname){

    candidates <- c( Sys.getenv("R_PROFILE"),
                     Sys.getenv("R_PROFILE_USER"),
                     file.path(getwd(), ".Rprofile"),
                     file.path(Sys.getenv("HOME"), ".Rprofile"))
    of <- Filter(file.exists, candidates)[1]
    if(is.na(of)){
        of <- file.path(Sys.getenv("HOME"), ".Rprofile")
    }
    if(file.exists(of)){
        rl <- readLines(of)
        if(!any(grepl("lolita", rl))){
            cat("\nlibrary(lolita)\n", file = of, append = TRUE)
        }
    } else {
        cat("\nlibrary(lolita)\n", file = of)
    }
}
