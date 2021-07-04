#' access_head
#'
#' @param rmd_path Path to the Rmd that requires accessible header metadata. Tmd
#' must be output type html.
#' 
#' @param replace Defaults to FALSE. Should the YAML be replaced or
#' supplemented.
#' 
#' @return Adjust the Rmd YAML provided to `rmd_path`, improving its
#' accessibility for screen readers. Only works with html output.
#' 
#' @importFrom htmltools tags withTags


# delete me ---------------------------------------------------------------
library(htmltools)
library(stringr)
rmd_path = "content/test.Rmd"
# delete me ---------------------------------------------------------------





access_head <- function(rmd_path = NULL, replace = FALSE){
  if(is.null(rmd_path)){
    stop("rmd_path not found.")
    
  } else if(!grepl(pattern = ".rmd", x = rmd_path, ignore.case = TRUE)){
    stop("Ensure that an Rmd file is passed to rmd_path.")
  }
  # read in the file lines
  lines <- readLines(rmd_path)
  # check for presence of YAML features
  yaml_bounds <- grep(pattern = "^---$", lines)
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
  # check for html output type. Stop if not.
  html_loc <- grepl(pattern = "^output: html_document$", head)

  if(any(html_loc)){
    # html found. subset out the html tag.
    head <- head[!html_loc]
  } else{
    stop("access_head() only works with html output.")
  }
  # Clean out the escape chars
  # remove all besides the alphabets, numbers, : and /
  # finding a simple implementation to remove single escapes is elusive
  head <- gsub("[^A-Za-z0-9:/]", "", head)
  # split the metadata on column and assign as named vector
  meta_list <- str_split(head, pattern = ":")
  # find title
  hd_index <- grep("title:", head)
  
  head[hd_index]

  
  
}

