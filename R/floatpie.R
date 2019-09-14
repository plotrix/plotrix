# display a pie chart at an arbitrary location on an existing plot

floating.pie<-function(xpos=0,ypos=0,x,edges=200,radius=1,col=NULL,
 startpos=0,shadow=FALSE,shadow.col=c("#ffffff","#cccccc"),
 explode=0,...) {

 # if no grahics device available, start one
 if(is.null(dev.list))
  plot(0,xlim=c(-1.5,1.5)*radius+xpos,ylim=c(-1.5,1.5)*radius+ypos,
   type="n",axes=FALSE,xlab="",ylab="")
 if (!is.numeric(x)) stop("floating.pie: x values must be numeric.")
 validx<-which(!is.na(x) & x > 0)
 # scale the values of x 0 to 1
 x<-c(0,cumsum(x[validx])/sum(x[validx]))
 dx<-diff(x)
 nx<-length(dx)
 if (is.null(col)) col<-rainbow(nx)
 else if(length(col) < nx) col<-rep(col,nx)
 # scale the y radius so that it's a circle
 xylim<-par("usr")
 plotdim<-par("pin")
 yradius<-
  radius*(xylim[4]-xylim[3])/(xylim[2]-xylim[1])*plotdim[1]/plotdim[2]
 # get the bisecting angles in radians
 bc<-2*pi*(x[1:nx]+dx/2)+startpos
 # don't dislay a shadow if any sectors are exploded
 if(shadow && all(explode == 0)) {
  xc<-c(cos(seq(0,2*pi,length=edges))*radius+xpos)
  yc<-c(sin(seq(0,2*pi,length=edges))*yradius+ypos)
  polygon.shadow(xc,yc,col=shadow.col)
 }
 if(length(explode) < nx) explode<-rep(explode,nx)
 for(i in 1:nx) {
  n<-max(2,floor(edges*dx[i]))
  t2p<-2*pi*seq(x[i],x[i+1],length=n)+startpos
  # calculate the positions of the arc plus the center
  xc<-c(cos(t2p)*radius+xpos,xpos)
  yc<-c(sin(t2p)*yradius+ypos,ypos)
  if(explode[i]) {
   xc<-xc + cos(bc[i]) * explode[i]
   yc<-yc + sin(bc[i]) * explode[i]
  }
  polygon(xc,yc,col=col[i],...)
  t2p<-2*pi*mean(x[i+0:1])+startpos
  xc<-cos(t2p)*radius
  yc<-sin(t2p)*radius
 }
 invisible(bc)
}

# place plain or boxed labels at the specified distance from x,y on the
# radial lines specified by angles.

pie.labels<-function(x=0,y=0,angles,labels,radius=1.05,bg="white",
 border=TRUE,minangle=NA,boxed=FALSE,explode=0,...) {

 if(missing(angles) || missing(labels))
  stop("Angles and labels must be specified.")
 # turn off clipping
 par(xpd=TRUE)
 # scale the y radius
 xylim<-par("usr")
 plotdim<-par("pin")
 yradius<-radius*(xylim[4]-xylim[3])/(xylim[2]-xylim[1])*plotdim[1]/plotdim[2]
 if(!is.na(minangle)) angles<-spreadout(angles,minangle)
 xc<-cos(angles)*(radius+explode)+x
 yc<-sin(angles)*(yradius+explode)+y
 for(label in 1:length(labels)) {
  label.adj<-c(abs(1-cos(angles[label]))/2,abs(1-sin(angles[label]))/2)
  if(boxed)
   boxed.labels(xc[label],yc[label],labels[label],adj=label.adj,
    border=border,...)
  else text(xc[label],yc[label],labels[label],adj=label.adj,...)
 }
 # turn clipping back on
 par(xpd=FALSE)
}
