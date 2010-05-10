\name{spark}
\alias{spark}
\title{Create sparkline as EPS graphics or HTML code}
\description{
  spark verifies the input parameters and stops the program if false parameters have been submitted.  
}
\usage{
spark(filename, para, type, output, outdir)
}
\arguments{
  \item{filename }{the name of the file where the data will be saved.}
  \item{para }{the list produced by the \code{\link{spark_init}} function}
  \item{type }{the plot type of the data, either "line", "box" or "bar}
  \item{output }{the output format, either "eps" or "html}
  \item{outdir }{ optional argument to which output should be saved. If this parameter is NULL, the current work-directory is used. }
}
\details{
}
\value{

}
\references{ }
\author{Bernhard Meindl, Alexander Kowarik, Statistics Austria }
\note{ 
}
\seealso{\code{\link{print.sparkTable}}, \code{\link{sparkTable_Config}}, \code{\link{spark}}, 
		\code{\link{spark_init}}, \code{\link{sparkHTML}}}
		
\examples{

# some basic examples can be found in the spark_init help

# generation of a bar-plot in EPS format

fn1 <-"examples/testBar1.eps"
para1 <- spark_init(rnorm(50,1.5,2), cw=200, ch=50, type="bar")
para1$top_padding <-  15
para1$bottom_padding <-  15	
para1$left_padding <- 10
para1$right_padding <- 10
para1$barSpacing <- 1
para1$barWidth <- 3
spark(fn1, para1, type="bar", output="eps")
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
