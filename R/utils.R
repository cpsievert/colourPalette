# from shinyjs:::formatHEX()
formatHEX <- function(x) {
  unlist(lapply(x, formatHEXsingle))
}

formatHEXsingle <- function(x) {
  if (is.null(x) || x == "")
    return(NULL)
  if (x == "transparent") {
    return(x)
  }
  if (x %in% grDevices::colors()) {
    x <- do.call(grDevices::rgb, as.list(grDevices::col2rgb(x)/255))
  }
  if (!grepl("^#?([[:xdigit:]]{3}|[[:xdigit:]]{6})$", x)) {
    stop(sprintf("%s is not a valid colour", x), call. = FALSE)
  }
  if (substr(x, 1, 1) != "#") {
    x <- paste0("#", x)
  }
  if (nchar(x) == 4) {
    x <- paste0("#", substr(x, 2, 2), substr(x, 2, 2), substr(x, 3, 3),
                substr(x, 3, 3), substr(x, 4, 4), substr(x, 4, 4))
  }
  toupper(x)
}