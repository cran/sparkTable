\name{plotSparkTable}
\alias{plotSparkTable}
\title{Plot objects of class 'sparkTable'}
\description{
  Function that plots objects of class 'sparkTable'.
}
\usage{
	plotSparkTable(object, outputType='html', filename=NULL, graphNames='out', ...)
}
\arguments{
  \item{object}{an object of class 'sparkTable'}
  \item{outputType}{a character vector of length one specifying the desired output format:
	  \itemize{
	  	\item 'tex': latex output is produced
	  	\item 'html': html output is procuded
	  }	
  }
  \item{filename}{ the filename of the output (minus '.tex' or '.html'}
  \item{graphNames}{ the main part of the single graphic files that are produced (minus '-someIndex.extension'}
  \item{...}{additional parameters to be passed}
}
\author{Bernhard Meindl, Alexander Kowarik, Statistics Austria }

\examples{
	data(pop,package="sparkTable")
	b <- newSparkBox()
	l <- newSparkLine()
	bb <- newSparkBar()
	content <- list(function(x) { round(mean(x),2) },
		b,
		l,
		bb,
		function(x) { round(tail(x,1),2) })
	names(content) <- paste("column",1:5,sep="")
	varType <- rep("value",5)
	pop <- pop[,c("variable","value","time")]
	pop$time <- as.numeric(as.character(pop$time))
	xx <- reshapeExt(pop,idvar="variable", varying=list(2))
	x1 <- newSparkTable(xx, content, varType)
	plotSparkTable(x1, outputType="html", graphNames="o2",filename="t1")
	plotSparkTable(x1, outputType="tex", graphNames="o3",filename="t2")
}
