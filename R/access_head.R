#' access_head
#'
#' @param rmd_path Path to the Rmd that requires accessible header metadata.
#' @param replace Defaults to FALSE. Should the YAML be replaced or
#' supplemented.
#' 
#' @return Adjust the Rmd YAML provided to `rmd_path`, improving its
#' accessibility for screen readers.
#' 
#' @importFrom htmltools tags withTags

access_head <- function(rmd_path = NULL, replace = FALSE){
  if(is.null(rmd_path)){
    stop("rmd_path not found.")
    
  } else if(!grepl(pattern = ".rmd", x = rmd_path, ignore.case = TRUE)){
    stop("Ensure that an Rmd file is passed to rmd_path.")
  }
  # read in the file lines
  lines <- readLines(rmd_path)
  # check for presence of YAML features
  yaml_bounds <- grep(pattern = "---", lines)
  # stop if YAML bounds not standard
  if(length(yaml_bounds) == 0){
    stop("YAML header not found.")
  } else if(length(yaml_bounds) != 2){
    stop("Non standard YAML found")
  }
  # produce yaml sequence
  yaml_seq <- yaml_bounds[1]:yaml_bounds[2]
  # extract yaml
  yaml_head <- lines[yaml_seq]
  # extract rmd body
  rmd_body <- setdiff(lines, yaml_head)
  # append the body with element tags
  rmd_body <- withTags(body(paste(rmd_body, collapse = "\n")))
# dynamic head logic ------------------------------------------------------
  # Will need to identify YAML elements present and convert to html flexibly
  # remove YAML bounds "---"
  head <- setdiff(yaml_head, "---")
  # find title
  head[grepl("title:", head)]

  
  
}

