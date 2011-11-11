\name{checkerplot}
\alias{checkerplot}
\title{Checkerplot}
\description{
   checkerplot
}
\usage{
  checkerplot(data, cols=5, rows=5, geom="line", errorbar=FALSE, title=NULL, title.size=20, label.size=11, xbreaks=NULL, xlabels=NULL, ybreaks=NULL, ylabels=NULL, ymin=NULL, ymax=NULL, img=NULL, aes_geom=NULL, formatter=NULL, margin_yaxis=0, opts=NULL, ...) 
}
\arguments{
  \item{data}{data frame}
  \item{cols}{number of columns in the grid}
  \item{rows}{number of rows in the grid}
  \item{geom}{defines the geom, the geometric object, of the plot ("line", "bar", "point" are possible at the moment)}
  \item{errorbar}{TRUE/FALSE plot additional errorbars (testing only)}
  \item{title}{title of the plot, displayed above the plot}
  \item{title.size}{font size of the plot title}
  \item{label.size}{font size of the labels}
  \item{xbreaks}{number of breaks for the x-axis, default it is calculated automatically}
  \item{xlabels}{labels of the breaks (optional)}
  \item{ybreaks}{number of breaks for the y-axis, default it is calculated automatically}
  \item{ylabels}{labels of the breaks (optional)}
  \item{ymin}{minimum value of y-axis displayed, if not provided it will be automatically calculated}
  \item{ymax}{maximum value of x-axis displayed, if not provided it will be automatically calculated}
  \item{img}{vector containing all names (must equal the label column in the dataframe data) of 
  pictures (pnm files) displayed beside the label}
  \item{aes_geom}{ggplot2 object to define the aesthetics of the geom}
  \item{formatter}{allows to format the y-axis (scale_x_continuous(formatter = formatter))}
  \item{margin_yaxis}{allows to adjust the distance from the plot to the left border of the grid for all elements 
  with an y-axis, because the difference number formats on the y-axis might 
  lead to a little displaced plot area}
  \item{opts}{ggplot2 object to change settings in the ggplot2 plots}
  \item{...}{further arguments passed through}
}
\author{Karin Fuerst, Alexander Kowarik, Matthias Templ}
		
\seealso{\code{\link{optimal_grid_allocation}}, \code{\link{plotGeoTable}}}
				
\examples{
### Directory of the package with flags
dirflags = paste(searchpaths()[grep("sparkTable", searchpaths())], "/etc/Flaggen/", sep="")
### EXAMPLE for EUROPE
  data(EU_data)
  order_eu = optimal_grid_allocation(EU_data[,16:17],8,7)
  colnames(EU_data)[1] <- c("country")
  EU_data[,18] <- order_eu
  colnames(EU_data)[1] <- c("country")
  colnames(EU_data)[18] <- c("order")
  data_eu = data.frame(cbind(rep(1997,34)), EU_data$unempl_f_1997, EU_data$country, EU_data$order)
  colnames(data_eu) = c("x", "y", "names", "order")
  for(year in 1998:2008){
    XX <- data.frame(cbind(rep(year,34)), EU_data[,paste("unempl_f_",year,sep="")], EU_data$country, EU_data$order)
    colnames(XX) = c("x", "y", "names", "order")
    data_eu = rbind(data_eu,XX)
  }
dirflags_eu=paste(dirflags,"EU/",sep="")
## Not run:
\dontrun{
checkerplot(data_eu, cols=8, rows=7, geom="line", img=dirflags_eu,margin_yaxis=0.1, 
            title = "Unemployment rate in Europe 1997 to 2008 (in \%)", title.size=18)
}
## End(Not run)

### EXAMPLE for US data
  data(coordUS)
  ## rearrange states which are far away:
  coordUS[coordUS$state \%in\% c("AK"),"x"] <- 0.4  ## rearrange Alaska
  coordUS[coordUS$state \%in\% c("HI"),"x"] <- 0.5       ## rearrange Hawaii
  ## optimal arrangement of the states:
  order <- optimal_grid_allocation(coordUS[,1:2],13,6) 
  order <- data.frame(names=coordUS$state,order=order) 
  ## load US healthy insurance data
  data(USdata1)
  data(USdata2)
  nam <- names(USdata1)
  ## delete previous order (optional)
  USdata1 <- USdata1[,-which(names(USdata1)=="order")]
  ## combine data and ordering:
  USdata1 <- merge(USdata1,order,all.x=TRUE,all.y=FALSE)
#  USdata1[is.na(USdata1$order),"order"] <- 14
  USdata1 <- USdata1[,nam] 
  ## define directory with flags (pnm's):
  dirflags_us=paste(dirflags,"USStates/",sep="")
## Not run: 
  \dontrun{
  checkerplot(USdata1[,-3], cols=13, rows=6, geom="line", 
            title="Health insurance coverage USA - 1999 to 2009", title.size=18, 
            img=dirflags_us, margin_yaxis=0, ymin=0.7, ymax=1,formatter=function(x,...)
             {sprintf("\%.1f", x)})
              
  checkerplot(USdata1[,-2], cols=13, rows=6, geom="bar", 
            title="Health insurance - not covered - USA - 1999 to 2009", title.size=18, 
            img=dirflags_us, margin_yaxis=0, ymin=0.0, ymax=0.3)

  checkerplot(USdata2[,-3], cols=13, rows=6, geom="bar", 
            title="US government provided health insurance 1999 and 2009 (in \% of the population)", 
            title.size=18, img=dirflags_us, margin_yaxis=0, formatter=function(x,...) {sprintf("\%.1f", x)})
            
  checkerplot(USdata2[,-2], cols=13, rows=6, geom="bar", 
            title="US private health insurance 1999 and 2009 (in \% of the population)",
            title.size=18, img=dirflags_us, margin_yaxis=0, formatter=function(x,...) {sprintf("\%.1f", x)})
}
## End(Not run)
}
