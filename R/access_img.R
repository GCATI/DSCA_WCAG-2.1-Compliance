#' access_img
#'
#' @param img The image to include as accessible HTML. Defaults to
#' 'ggplot2::last_plot()'. Can be replaced with an image written to disc.
#' @param alt A character string describing the image for screen reader
#' accessibility.
#' @param width Width of the image in pixels. Defaults to 500.
#' @param height Height of the image in pixels. Defaults to 500.
#' @return Inline HTML with the necessary structure for screen reader
#' accessibility.
#' 
#' 

access_img <- function(img = last_plot(), alt = NULL, width = 500,
                       height = 500){
  if(alt = NULL){
    stop("Please include alt text")
  }
  
}