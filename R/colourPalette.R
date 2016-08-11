#' Create a colour palette widget
#'
#' Create an input control to select a colour, \emph{with or without shiny}
#'
#' A colour input allows users to select a colour by clicking on the desired
#' colour, or by entering a valid HEX colour in the input box. The input can
#' be initialized with either a colour name or a HEX value. The return value is
#' a HEX value by default, but you can use the \code{returnName = TRUE} parameter
#' to get an R colour name instead (only when an R colour exists for the
#' selected colour).
#'
#' Since most functions in R that accept colours can also accept the value
#' "transparent", \code{colourInput} has an option to allow selecting the
#' "transparent" colour. When the user checks the checkbox for this special
#' colour, the returned value form the input is "transparent".
#'
#' @param label Display label for the control, or `\code{NULL} for no label.
#' @param value Initial value (can be a colour name or HEX code)
#' @param showColour Whether to show the chosen colour as text inside the input,
#' as the background colour of the input, or both (default).
#' @param palette The type of colour palette to allow the user to select colours
#' from. \code{square} (default) shows a square colour palette that allows the
#' user to choose any colour, while \code{limited} only gives the user a
#' predefined list of colours to choose from.
#' @param allowedCols A list of colours that the user can choose from. Only
#' applicable when \code{palette == "limited"}. The \code{limited} palette
#' uses a default list of 40 colours if \code{allowedCols} is not defined.
#' @param allowTransparent If \code{TRUE}, then add a checkbox that allows the
#' user to select the \code{transparent} colour.
#' @param transparentText The text to show beside the transparency checkbox
#' when \code{allowTransparent} is \code{TRUE}. The default value is
#' "Transparent", but you can change it to "None" or any other string. This has
#' no effect on the return value from the input; when the checkbox is checked,
#' the input will always return the string "transparent".

#' @seealso \code{\link[shinyjs]{updateColourInput}}
#' \code{\link[shinyjs]{colourPicker}}
#'
#' @note This function is an adaption of the fabulous \code{\link[shinyjs]{colourInput}}
#' so that htmlwidgets can take advantage of colour palette changes, without shiny.
#' @export
#' @examples
#' # TODO: get label working (also height/width!)
#' colourPalette("hey there", "red", palette = "limited", allowedCols = c("red", "blue"))
colourPalette <- function(label, value = "white",
                          showColour = c("both", "text", "background"),
                          palette = c("square", "limited"),
                          allowedCols = NULL,
                          allowTransparent = FALSE, transparentText = NULL) {
  # sanitize the arguments
  x <- list(
    value = formatHEX(value),
    showColour = match.arg(showColour),
    palette = match.arg(palette),
    allowedCols = paste(formatHEX(allowedCols), collapse = " "),
    allowTransparent = allowTransparent,
    transparentText = transparentText
  )
  # TODO: add height/width/sizingPolicy
  htmlwidgets::createWidget("colourPalette", x = x)
}