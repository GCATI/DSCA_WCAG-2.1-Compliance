#' access_head
#'
#' @param rmd_path Path to the Rmd that requires accessible header metadata.
#' @param replace Defaults to FALSE. Should the YAML be replaced or
#' supplemented.
#' 
#' @return Adjust the Rmd YAML provided to `rmd_path`, improving its
#' accessibility for screen readers.
#' 
#' @importFrom ggplot2 last_plot ggsave
#' @importFrom htmltools tags$img

access_head <- function(rmd_path = NULL, replace = FALSE){
  if(is.null(rmd_path)){
    stop("rmd_path not found.")
    
  } else if(!grepl(pattern = ".rmd", x = rmd_path, ignore.case = TRUE)){
    stop("Ensure that an Rmd file is passed to rmd_path.")
  }
}

