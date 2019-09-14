plotH <- function (x,...) {
  UseMethod("plotH") 
}

plotH.formula <- function(x,data=NULL,xlab=names(mf)[2],ylab=names(mf)[1],...) {
  mf <- model.frame(x,data=data)                               # get model frame
  if (ncol(mf)>2) stop("Function currently only accepts one variable on RHS of formula")
  plotH.default(mf[,2],mf[,1],xlab=xlab,ylab=ylab,...)
}

plotH.default <- function(x,y,xlab=paste(deparse(substitute(x))),
 ylab=paste(deparse(substitute(y))),width=0.6,ylim=NULL,col="gray",...) {
  plotHq <- function(x,y,xlab,ylab,width,ylim,col,...) {
    if (is.null(width)) width <- min(diff(x))
    xleft <- x-width/2
    xright <- x+width/2
    ytop <- y
    ynegs <- y[is.finite(y)]<0
    if (all(ynegs)) {
      ## All values negative: tops must be bottoms, bottom is top of ylim
      ybottom <- ytop
      if (is.null(ylim)) ylim <- c(min(y[is.finite(y)]),0)
      ytop <- ylim[2]
    } else if (any(ynegs)) {
      # Some values negative: tops are fine, make bottoms =0
      ybottom <- 0
      if (is.null(ylim)) ylim <- range(y[is.finite(y)])
    } else {
      # All values positive: tops are fine, bottom is bottom of ylim 
      if (is.null(ylim)) ylim <- c(0,max(y[is.finite(y)]))
      ybottom <- ylim[1]
    }
    plot(x,y,type="n",ylim=ylim,xlab=xlab,ylab=ylab,...)
    rect(xleft,ybottom,xright,ytop,col=col,...)
  }  # end plotHq internal function

  plotHc <- function(x,y,xlab,ylab,width,ylim,col,...) {
    names(y) <- x
    barplot(y,xlab=xlab,ylab=ylab,width=width,ylim=ylim,col=col,...)
  }  # end plotHc internal function
 ## Start of main function
  if (!is.numeric(y)) stop("Y (or LHS) variable must be quantitative.")
  if (is.numeric(x)) plotHq(x,y,xlab,ylab,width,ylim,col,...)
    else plotHc(x,y,xlab,ylab,width,ylim,col,...) 
}
