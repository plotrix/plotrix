joyPlot<-function(x,mar=c(5,4,4,2),newrange=c(0,1),border=NA,fill=NULL,
 main="",xlab="",ylab="",xlim=NA,line_labels=names(x),xat=NULL,
 xaxlab=NULL) {

 oldmar<-par(mar=mar)
 nlines<-length(x)
 xmin<-min(x[[1]]$x,na.rm=TRUE)
 xmax<-max(x[[1]]$x,na.rm=TRUE)
 ymax<-max(x[[1]]$y,na.rm=TRUE)
 for(i in 2:nlines) {
  thisxmin<-min(x[[i]]$x,na.rm=TRUE)
  if(thisxmin < xmin) xmin<-thisxmin
  thisxmax<-max(x[[i]]$x,na.rm=TRUE)
  if(thisxmax < xmax) xmax<-thisxmax
  ymax<-c(ymax,max(x[[i]]$y,na.rm=TRUE))
 }
 if(is.na(xlim[1])) xlim<-c(xmin,xmax)
 oaymax<-max(ymax)
 if(is.na(border[1])) border<-rainbow(nlines)
 else if(length(border) < nlines) border=rep(border,length.out=nlines)
 if(!is.null(fill)) if(length(fill) < nlines)
  fill<-rep(fill,length.out=nlines)
 plot(0,type="n",xlim=xlim,ylim=c(0,nlines+newrange[2]-1),
  main=main,xlab=xlab,ylab=ylab,xaxt="n",yaxt="n")
 if(is.null(xat)) axis(1)
 else {
  if(is.null(xaxlab)) xaxlab<-xat
  axis(1,at=xat,labels=xaxlab)
 }
 abline(h=0:(nlines-1),col="lightgray")
 if(is.null(line_labels)) line_labels<-1:nlines
 axis(2,at=0:(nlines-1)+0.5,labels=line_labels,las=1)
 for(i in nlines:1) {
  thisrange<-c(newrange[1],newrange[2]*ymax[i]/oaymax)
  x[[i]]$y<-rescale(x[[i]]$y,thisrange)+i-1
  if(is.null(fill[i])) lines(x[[i]],col=border[i])
  else polygon(x[[i]],border=border[i],col=fill[i])
 }
 box()
 par(mar=oldmar)
}
