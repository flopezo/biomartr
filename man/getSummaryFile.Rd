% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/getSummaryFile.R
\name{getSummaryFile}
\alias{getSummaryFile}
\title{Helper function to retrieve the assembly_summary.txt file from NCBI}
\usage{
getSummaryFile(db, kingdom)
}
\arguments{
\item{db}{database name. E.g. \code{refseq} or \code{genbank}.}

\item{kingdom}{kingdom for which assembly_summary.txt file shall be retrieved. See also \code{\link{getKingdoms}}.}
}
\description{
Retrieval function of the assembly_summary.txt file from NCBI.
}
\examples{
test <- getSummaryFile("refseq","plant")
test
}
\author{
Hajk-Georg Drost
}
\seealso{
\code{\link{getKingdomAssemblySummary}}, \code{\link{getMetaGenomeSummary}}
}

