\name{print.sparkTable}
\alias{print.sparkTable}
\title{Generates a EPS or HTML plot of a meta-object}
\description{
This function creates a EPS or HTML output in \R, depending on the meta object created with sparkTable_Config. 
}
\usage{
print.sparkTable(x, outdir = NULL, outfile = NULL, digits = 2,...)
}
\arguments{
  \item{x }{ an object created with \code{\link{sparkTable_Config}} }
  \item{outdir }{ optional argument to which EPS-images should be saved. If this parameter is NULL, the current work-directory is used. }
  \item{outfile}{ if set an html/tex file will be created with the output}
  \item{digits}{ number of digits of the numerical parts in the table}
  \item{...}{ are ignored at the moment}
}
\author{Bernhard Meindl, Alexander Kowarik, Statistics Austria  }
\seealso{\code{\link{print.sparkTable}}, \code{\link{sparkTable_Config}}, \code{\link{spark}}, 
		\code{\link{spark_init}}, \code{\link{sparkHTML}}}
		
\examples{

data(gini)
meta <- sparkTable_Config(gini, groups=c("AT","DE","IT"), 
		groupVar="country", 
		vars=c("gini"), 
		typeNumeric=c("mean","median"), 
		typePlot="line",
		output="eps")

# this meta object can now be used to generate an EPS-output in R
eps.text <- print.sparkTable(meta, outdir="examples")

}
\keyword{ hplot }
