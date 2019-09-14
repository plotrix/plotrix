# incoming data frame must be latitude, longitude and optionally intensity
# as individual vectors or a list or data frame containing these
makeDensityMatrix<-function(x,y,z=NULL,nx=100,ny=50,zfun=c("mean","sum"),
 xlim=c(-180,180),ylim=c(-90,90),geocoord=TRUE) {
 
 if(is.list(x)) {
  y<-x[[1]]
  # if there is a third column, it's intensity
  if(length(x) > 2) z<-x[[3]]
  x<-x[[2]]
 }
 xbreaks<-seq(xlim[1],xlim[2],length.out=nx+1)
 ybreaks<-seq(ylim[1],ylim[2],length.out=ny+1)
 xcells<-as.numeric(cut(x,xbreaks,include.lowest=TRUE))
 # reverse the y (latitude) limits as the matrix displays from the top down
 ycells<-(ny+1)-as.numeric(cut(y,ybreaks,include.lowest=TRUE))
 # discard any NA values resulting from observations outside the lat/lon limits
 notNA<-!is.na(xcells) & !is.na(ycells)
 xcells<-xcells[notNA]
 ycells<-ycells[notNA]
 # need two matrices, one for counts, one for intensities
 densmat<-matrix(0,nrow=ny,ncol=nx)
 # midpoints of the y (latitude) cells to correct for shrinkage of area
 # abs is needed to prevent negative secants in southern latitudes
 if(geocoord) ymult<-1/cos(pi*abs(ybreaks[1:ny]+ybreaks[1:ny+1])/360)
 else ymult<-rep(1,ny)
 # equivalent to "table" except that it preserves zero cell counts
 for(i in 1:ny) densmat[i,]<-tabulate(xcells[ycells==i],nx)*ymult[i]
 if(is.null(z)) {
  cat("Range of density (>0) -",range(densmat[densmat > 0]),"\n")
  return(densmat)
 } else {
  intensmat<-matrix(0,nrow=ny,ncol=nx)
  # accumulates the 'z' values in the appropriate grid cells
  for(i in 1:length(xcells))
   intensmat[ycells[i],xcells[i]]<-intensmat[ycells[i],xcells[i]]+z[i]
  # calculate the mean intensity of all non-zero density cells
  if(zfun[1] == "mean")
   intensmat[densmat > 0]<-intensmat[densmat > 0]/densmat[densmat > 0]
  cat("Range of density (>0) -",range(densmat[densmat > 0]),"\n")
  cat("Range of intensity (>0) -",range(intensmat[intensmat > 0]),"\n")
  return(list(densmat,intensmat))
 }
}

# x is either a matrix of cell frequencies or a list containing matrices of
# cell frequencies and cell intensities
densityGrid<-function(x,z=NULL,xrange=NA,zrange=NA,range.cex=c(1,10),
 xlim=c(-180,180),ylim=c(-90,90),red=c(0,1),green=c(0,1),blue=c(0,1),alpha=1,
 pch=".",geocoord=TRUE) {

 # if x is a list of two matrices, the second will be intensity values
 if(is.list(x)) {
  z<-x[[2]]
  if(is.na(zrange[1])) {
   zrange<-pretty(range(z[z>0]))
   zrange<-zrange[c(1,length(zrange))]
  }
  x<-x[[1]]
 }
 if(is.na(xrange[1])) {
  xrange<-pretty(range(x[x>0]))
  xrange<-xrange[c(1,length(xrange))]
 }
 # get the dimensions of the matrix x
 dimx<-dim(x)
 # calculate the half grid increments in user units on the plot
 posinc1<-0.5*diff(ylim)/dimx[1]
 posinc2<-0.5*diff(xlim)/dimx[2]
 # calculate the positions of the centers of the cells
 xpos<-rep((seq(xlim[1],xlim[2],length.out=dimx[2]+1)-posinc2)[-1],each=dimx[1])
 ypos<-rep((seq(ylim[2],ylim[1],length.out=dimx[1]+1)+posinc1)[-1],dimx[2])
 # get the order of ascending counts in the matrix
 m2v<-order(x)
 if(is.null(z)) {
  # calculate the expansion for the symbols - areas proportional to counts
  if(length(range.cex) > 1) cexs<-rescale(x,range.cex)
  else cexs<-rep(range.cex[1],dimx[1])
  # color repeats cell count
  cols<-x
  cols[x>0]<-color.scale(x[x>0],cs1=red,cs2=green,cs3=blue,alpha=alpha,
   xrange=xrange)
 } else {
  # areas proportional to cell count
  if(length(range.cex) > 1) {
   cexs<-x
   cexs[x>0]<-rescale(x[x>0],range.cex)
  }
  else cexs<-rep(range.cex[1],dimx[1])
  # color is cell intensity
  cols<-z
  cols[x>0]<-color.scale(z[x>0],cs1=red,cs2=green,cs3=blue,alpha=alpha,
   xrange=zrange)
 }
 # display the points - don't display anything in cells with zero counts
 for(i in m2v) {
  if(x[i] > 0) points(xpos[i],ypos[i],pch=pch,cex=cexs[i],col=cols[i])
 }
}
