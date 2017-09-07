#' PCxN object which holds the type of analysis it came from, the data produced 
#' by the analysis and the geneset groups involved. It can be produced by the 
#' explore_pcxn() or analyze_pcxn() functions.
#'
#' @slot type character. 
#' @slot data matrix. 
#' @slot geneset_groups list. 
#'
#' @return pcxn_obj with a type, data and geneset_grous field
#' @export
#'
#' @examples
#' \dontrun{
#' pcxn_obj
#' }
#' 
setClass("pcxn_obj", representation(type = "character" , data = "matrix",
                                    geneset_groups = "list"))