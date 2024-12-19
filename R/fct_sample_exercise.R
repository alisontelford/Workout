#' sample_exercise
#'
#' @description A function designed to sample from a list of exercises grouped by type to produce a more rounded program.
#' @import dplyr
#' @param ex_list A list of exercises to be sampled from.
#' @return `ex_sample` A vector containing 5 sampled exercises.
#' @export
#'
#'
sample_exercise <- function(ex_list) {
  l=length(ex_list)
  ex_sample=NULL
  if (l >= 5){
    ex_cat=sample(seq(1:l), 5)
  }else{
    if ("others" %in% names(ex_list)){
      ex_cat=sample(setdiff(seq(1:l), which("others" == names(ex_list))), l-1)
      ex_sample=sample(ex_list[["others"]], 5-(l-1))
    }else{
      ex_cat=sample(seq(1:l), 5, replace=T)
    }
  }
  ex_sample=c(ex_sample, sapply(ex_cat, function(x){sample(ex_list[[x]], 1)}))
  return(ex_sample)
}

