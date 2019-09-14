dispersion<-function (x, y, ulim, llim = ulim, intervals = TRUE, arrow.cap = 0.01, 
    arrow.gap = NA, type = "a", fill = NA, lty = NA, pch = NA, 
    border = NA, col = par("fg"), display.na = TRUE, ...) 
{
    if (is.list(x) && length(x[[1]]) == length(x[[2]])) {
        y <- x$y
        x <- x$x
    }
    if (missing(y) && !missing(x)) {
        y <- x
        x <- 1:length(x)
    }
    if (intervals) {
        llim <- y - llim
        ulim <- y + ulim
    }
    plotlim <- par("usr")
    npoints <- length(x)
    if (is.na(arrow.gap)) 
        arrow.gap <- strheight("O")/1.5
    if (length(col) < npoints) {
        if (is.matrix(x) && length(col) == dim(x)[2]) 
            col <- rep(col, each = dim(x)[1])
        else col <- rep(col, npoints)
    }
    for (i in 1:npoints) {
        if (toupper(type) == "A") {
            if (!is.na(llim[i])) {
                if (arrow.gap >= (y[i] - llim[i]) * 0.9) {
                  caplen <- arrow.cap * diff(par("usr")[1:2])
                  x0 <- x[i] - caplen
                  x1 <- x[i] + caplen
                  y0 <- y1 <- llim[i]
                  segments(x0, y0, x1, y1, col = col[i], ...)
                }
                else {
                  caplen <- arrow.cap * par("pin")[1]
                  x0 <- x1 <- x[i]
                  y0 <- y[i] - arrow.gap
                  y1 <- llim[i]
                  arrows(x0, y0, x1, y1, length = caplen, angle = 90, 
                    col = col[i], ...)
                }
            }
            else {
                if (display.na) {
                  x0 <- x1 <- x[i]
                  y0 <- y[i] - arrow.gap
                  y1 <- plotlim[3]
                  segments(x0, y0, x1, y1, col = col[i], ...)
                }
            }
            if (!is.na(ulim[i])) {
                if (arrow.gap >= (ulim[i] - y[i]) * 0.9) {
                  caplen <- arrow.cap * diff(par("usr")[1:2])
                  x0 <- x[i] - caplen
                  x1 <- x[i] + caplen
                  y0 <- y1 <- ulim[i]
                  segments(x0, y0, x1, y1, col = col[i], ...)
                }
                else {
                  caplen <- arrow.cap * par("pin")[1]
                  x0 <- x1 <- x[i]
                  y0 <- y[i] + arrow.gap
                  y1 <- ulim[i]
                  arrows(x0, y0, x1, y1, length = caplen, angle = 90, 
                    col = col[i], ...)
                }
            }
            else {
                if (display.na) {
                  x0 <- x1 <- x[i]
                  y0 <- y[i] + arrow.gap
                  y1 <- plotlim[4]
                  segments(x0, y0, x1, y1, col = col[i], ...)
                }
            }
        }
    }
    if (toupper(type) == "L") {
        if (!is.na(fill)) {
            polygon(c(x, rev(x)), c(ulim, rev(llim)), col = fill, 
                border = NA)
            if (!is.na(pch)) {
                if (is.na(lty)) 
                  points(x, y, pch = pch)
                else lines(x, y, lty = lty, pch = pch, type = "b")
            }
            else {
                if (!is.na(lty)) 
                  lines(x, y, lty = lty)
            }
        }
        if (!is.na(border)) {
            lines(x, ulim, lty = border, ...)
            lines(x, llim, lty = border, ...)
        }
    }
}
