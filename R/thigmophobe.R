# function contributed by Bill Venables as a replacement for thigmophobe
thigmophobe <- function (x, y = NULL, names = seq_along(z),
                   xlog = par("xlog"), ylog = par("ylog"), 
                   usr = par("usr"), pin = par("pin"), 
                   eps = .Machine$double.eps, pi = base::pi) {
  # convert separete x and y coordinates to a two element list
  xy <- grDevices::xy.coords(x, y, recycle = TRUE)
  z <- with(xy, {
    x <- ((if(xlog) log(x) else x) - usr[1])/diff(usr[1:2])*pin[1]
    y <- ((if(ylog) log(y) else y) - usr[3])/diff(usr[3:4])*pin[2]
    complex(real = x, imaginary = y)
  })
  # calculate the matrix of distances
  xydist <- outer(z, z, function(x, y) Mod(x - y))
  # remove "self" distances
  diag(xydist) <- Inf
  # get the indicies of the smallest distances
  nearby <- apply(xydist, 2, which.min)
  zdiff <- z - z[nearby]
  # get the offset away from the nearest point for each label
  pos <- findInterval((-pi/4 - Arg(zdiff)) %% (2*pi), 
                      seq(0, 2*pi, by = pi/2), all.inside = TRUE)
  # stagger the offsets for points with essentially zero differences
  if(any(k <- Mod(zdiff) <= eps)) {
    for(k in which(k)) {
      pos[sort(c(k, nearby[k]))] <- c(1,3)
    }
  }
  names(pos)<-names
  return(pos)
}
