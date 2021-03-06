#' @title Retrieve available kingdoms of life stored in RefSeq
#' @description A short list of kingdoms of life that are stored in the RefSeq
#' database and that can be downloaded using e.g. \code{\link{meta.retrieval}}, \code{\link{getGenome}}, etc.
#' @param db a character string specifying the database from which the genome shall be retrieved: \code{db = "refseq"}, \code{db = "genbank"}, \code{db = "ensembl"}, \code{db = "ensemblgenomes"}.
#' Default is \code{db = "refseq"}.
#' @author Hajk-Georg Drost
#' @examples 
#' # retrieve kingdoms available at refseq
#' getKingdoms(db = "refseq")
#' 
#' # retrieve kingdoms available at genbank
#' getKingdoms(db = "genbank")
#' @seealso \code{\link{meta.retrieval}}, \code{\link{getGenome}}, \code{\link{getProteome}}, \code{\link{getCDS}}
#' @export

getKingdoms <- function(db = "refseq"){
    
    if (!is.element(db, c("refseq", "genbank","ensembl", "ensemblgenomes")))
        stop("Please select one of the available data bases: 'refseq', 'genbank', 'ensembl', or 'ensemblgenomes'.", call. = FALSE)
    
    if (db == "refseq") {
        return(
            c(
                "archaea",
                "bacteria",
                "fungi",
                "invertebrate",
                "plant",
                "protozoa",
                "vertebrate_mammalian",
                "vertebrate_other",
                "viral"
            )
        )
    }
    
    if (db == "genbank") {
        return(
            c(
                "archaea",
                "bacteria",
                "fungi",
                "invertebrate",
                "plant",
                "protozoa",
                "vertebrate_mammalian",
                "vertebrate_other"
            )
        )
    }
    
    if (db == "ensembl") {
        ensemblinfo <- get.ensembl.info()
        ensemblgenomesinfo <-  get.ensemblgenome.info()
        
        joined.df <-
            dplyr::inner_join(ensemblinfo, ensemblgenomesinfo, by = "name")
        
        return(names(table(joined.df$division.y)))
    }
    
    if (db == "ensemblgenomes") {
        ensemblgenomesinfo <-  get.ensemblgenome.info()
        return(names(table(ensemblgenomesinfo$division)))
    }
}












