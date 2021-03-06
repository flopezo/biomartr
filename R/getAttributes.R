#' @title Retrieve All Available Attributes for a Specific Dataset
#' @description This funcion queries the BioMart Interface and returns a table
#' storing all available attributes for a specific dataset.
#' 
#' @param mart a character string specifying the database (mart) for which datasets shall be listed.
#' @param dataset a character string specifying the dataset for which attributes shall be listed.
#' @author Hajk-Georg Drost
#' @examples
#' 
#' \dontrun{
#' 
#' # search for available datasets
#' getMarts()
#' 
#' # choose database (mart): ENSEMBL_MART_ENSEMBL
#' # and get a table of all available datasets from this BioMart database
#' head(getDatasets(mart = "ENSEMBL_MART_ENSEMBL"), 10)
#' 
#' # choose dataset: "hsapiens_gene_ensembl"
#' head(getAttributes(mart = "ENSEMBL_MART_ENSEMBL", dataset = "hsapiens_gene_ensembl") , 5)
#' 
#' }
#' 
#' @seealso \code{\link{getMarts}}, \code{\link{getDatasets}},\code{\link{getFilters}}, \code{\link{organismBM}}, \code{\link{organismFilters}}, \code{\link{organismAttributes}}
#' @export
getAttributes <- function(mart, dataset){
        
        if((!is.character(mart)) || (!is.character(dataset)))
                stop("Please use a character string as mart or dataset.")
        
        url <- paste0("http://www.ensembl.org/biomart/martservice?type=attributes&dataset=",dataset,"&requestid=biomart&mart=",mart,"&virtualSchema=default")
        
        attributesPage <- httr::handle(url)
        xmlContentAttributes <- httr::GET(handle = attributesPage)
        
        httr::stop_for_status(xmlContentAttributes)
        
        # extract attribute name and attribute description
        suppressWarnings(rawDF <- do.call("rbind",apply(as.data.frame(strsplit(httr::content(xmlContentAttributes,as = "text"),"\n")),1,function(x) unlist(strsplit(x,"\t")))))
        
        colnames(rawDF) <- paste0("V",1:ncol(rawDF))
        
        attrBioMart <- as.data.frame(rawDF[ , c("V1","V2")], stringsAsFactors = FALSE, colClasses = rep("character",2))
        colnames(attrBioMart) <- c("name","description")
        
        return(attrBioMart)
}











