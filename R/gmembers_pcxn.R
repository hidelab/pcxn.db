# FUNCTION
# - arguments: pathway_name
# - returns: a dataframe of the names and entrez ids of the pathway's 
# gene members

# packages: biocLite("org.Hs.eg.db"), biocLite("org.Hs.eg.db")

utils::globalVariables(c("org.Hs.eg.db", "annotate","getSYMBOL"))

#' Acquire the gene members of one of the available pathways 
#'
#' @param pathway_name the  pathway whose members we want
#'
#' @return list of gene names and Ids
#' @export
#'
#' @examples
#' \dontrun{
#'  gmembers_pcxn("Alzheimer's disease (KEGG)")
#' }

gmembers_pcxn <- function(pathway_name = "Alzheimer's disease (KEGG)") {

  
  attachNamespace("org.Hs.eg.db")
  # requireNamespace(annotate)

  data(pathprint.Hs.gs, envir = environment())
  data(h_gs_v5.1.rda, envir = environment())
  data(gobp_gs_v5.1.rda, envir = environment())
  data(cp_gs_v5.1.rda, envir = environment())

  # every geneset we offer
  genesets <- c(pathprint.Hs.gs,h_gs_v5.1,gobp_gs_v5.1,cp_gs_v5.1)

  # stop if the selected pathway is not correct
  if(!(pathway_name %in% names(genesets))) 
      stop( "Invalid pathway name, please choose a pathway from: pathprint, 
            MSigDB_H, MSigDB_C2_CP or MSigDB_C5_GO_BP")

  # extract the desired entrez-ids
  result_genesets <- c()
  for (i in 1:length(genesets)) {
    if(names(genesets[i]) == pathway_name) result_genesets <- genesets[[i]]
  }

  result_genesets_symbols <- annotate::getSYMBOL((result_genesets), data='org.Hs.eg')

  geneset_matrix = matrix(0,nrow=length(result_genesets), 2)
  colnames(geneset_matrix) = c("Entrez ids","Gene name")
  geneset_matrix[,"Entrez ids"] <- result_genesets
  geneset_matrix[,"Gene name"] <- result_genesets_symbols

  return(geneset_matrix)
}
