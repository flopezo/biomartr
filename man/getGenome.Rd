% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/getGenome.R
\name{getGenome}
\alias{getGenome}
\title{Genome Retrieval}
\usage{
getGenome(db = "refseq", organism, path = file.path("_ncbi_downloads",
  "genomes"))
}
\arguments{
\item{db}{a character string specifying the database from which the genome shall be retrieved: \code{db = "refseq"}, \code{db = "genbank"}, \code{db = "ensembl"}, or \code{db = "ensemblgenomes"}.}

\item{organism}{a character string specifying the scientific name of the organism of interest, e.g. \code{organism = "Homo sapiens"}.}

\item{path}{a character string specifying the location (a folder) in which the corresponding
genome shall be stored. Default is \code{path} = \code{file.path("_ncbi_downloads","genomes")}.}
}
\value{
File path to downloaded genome.
}
\description{
This function retrieves a fasta-file storing the genome of an organism of interest and stores
the genome file in the folder '_ncbi_downloads/genomes'.
}
\details{
Internally this function loads the the overview.txt file from NCBI:

 refseq: ftp://ftp.ncbi.nlm.nih.gov/genomes/refseq/

 genbank: ftp://ftp.ncbi.nlm.nih.gov/genomes/genbank/
 
and creates a directory '_ncbi_downloads/genomes' to store
the genome of interest as fasta file for future processing.
In case the corresponding fasta file already exists within the
'_ncbi_downloads/genomes' folder and is accessible within the workspace,
no download process will be performed.
}
\examples{
\dontrun{

# download the genome of Arabidopsis thaliana from refseq
# and store the corresponding genome file in '_ncbi_downloads/genomes'
file_path <- getGenome( db       = "refseq", 
             organism = "Arabidopsis thaliana", 
             path = file.path("_ncbi_downloads","genomes"))

Ath_genome <- read_genome(file_path, format = "fasta")


# download the genome of Arabidopsis thaliana from genbank
# and store the corresponding genome file in '_ncbi_downloads/genomes'
file_path <- getGenome( db       = "genbank", 
             organism = "Arabidopsis thaliana", 
             path = file.path("_ncbi_downloads","genomes"))

Ath_genome <- read_genome(file_path, format = "fasta")
}
}
\author{
Hajk-Georg Drost
}
\references{
\url{ftp://ftp.ncbi.nlm.nih.gov/genomes/refseq}

\url{ftp://ftp.ncbi.nlm.nih.gov/genomes/genbank}

\url{http://www.ncbi.nlm.nih.gov/refseq/about/}
}
\seealso{
\code{\link{getProteome}}, \code{\link{getCDS}}, \code{\link{getGFF}}, \code{\link{meta.retrieval}}, \code{\link{read_genome}}
}

