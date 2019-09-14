# Display a Taylor diagram
# Taylor K.E. (2001)
# Summarizing multiple aspects of model performance in a single diagram
# Journal of Geophysical Research, 106: 7183-7192.

# version 1.0
# progr. Olivier.Eterradossi, 12/2007
# 2007-01-12 - modifications and Anglicizing - Jim Lemon
# version 2.0
# progr. initiale OLE, 8/01/2007
# rev. OLE 3/09/2008 : remove samples with NA's from mean, sd and cor calculations 
# 2008-09-04 - integration and more anglicizing - Jim Lemon
# 2008-12-09 - added correlation radii, sd arcs to the pos.cor=FALSE routine
# and stopped the pos.cor=FALSE routine from calculating arcs for zero radius
# Jim Lemon
# 2010-4-30 - added the gamma.col argument for pos.cor=TRUE plots - Jim Lemon
# 2010-6-24 - added mar argument to pos.cor=TRUE plots - Jim Lemon
# 2012-1-31 - added the cex.axis argument - Jim Lemon
# 2019-02-22 - added cex.axis to Olivier's text calls plus adj and srt

taylor.diagram<-function(ref,model,add=FALSE,col="red",pch=19,pos.cor = TRUE, 
    xlab = "Standard deviation", ylab = "", main = "Taylor Diagram",
    show.gamma = TRUE, ngamma = 3, gamma.col = 8, sd.arcs = 0, ref.sd = FALSE,
    sd.method = "sample", grad.corr.lines = c(0.2, 0.4, 0.6, 0.8, 0.9), 
    pcex = 1, cex.axis = 1, normalize = FALSE, mar = c(4, 3, 4, 3), ...) {
    
    grad.corr.full <- c(0, 0.2, 0.4, 0.6, 0.8, 0.9, 0.95, 0.99, 1)
  # convert any list elements or data frames to vectors
   R <- cor(ref, model, use = "pairwise")
    if (is.list(ref)) 
        ref <- unlist(ref)
    if (is.list(model)) 
        ref <- unlist(model)
    SD <- function(x, subn) {
        meanx <- mean(x, na.rm = TRUE)
        devx <- x - meanx
        ssd <- sqrt(sum(devx * devx, na.rm = TRUE)/(length(x[!is.na(x)]) - 
            subn))
        return(ssd)
    }
    subn <- sd.method != "sample"
    sd.r <- SD(ref, subn)
    sd.f <- SD(model, subn)
    if (normalize) {
        sd.f <- sd.f/sd.r
        sd.r <- 1
    }
    maxsd <- 1.5 * max(sd.f, sd.r)
    oldpar <- par("mar", "xpd", "xaxs", "yaxs")
    if (!add) {
       par(mar = mar)
       # display the diagram
       if (pos.cor) {
            if (nchar(ylab) == 0) 
                ylab = "Standard deviation"
            plot(0, xlim = c(0, maxsd*1.1), ylim = c(0, maxsd*1.1), xaxs = "i", 
                yaxs = "i", axes = FALSE, main = main, xlab = "", 
                ylab = ylab, type = "n", cex = cex.axis, ...)
            mtext(xlab,side=1,line=2.3)
            if (grad.corr.lines[1]) {
                for (gcl in grad.corr.lines) lines(c(0, maxsd * 
                  gcl), c(0, maxsd * sqrt(1 - gcl^2)), lty = 3)
            }
   # add the axes
           segments(c(0, 0), c(0, 0), c(0, maxsd), c(maxsd, 
                0))
            axis.ticks <- pretty(c(0, maxsd))
            axis.ticks <- axis.ticks[axis.ticks <= maxsd]
            axis(1, at = axis.ticks,cex.axis=cex.axis)
            axis(2, at = axis.ticks,cex.axis=cex.axis)
            if (sd.arcs[1]) {
                if (length(sd.arcs) == 1) 
                  sd.arcs <- axis.ticks
                for (sdarc in sd.arcs) {
                  xcurve <- cos(seq(0, pi/2, by = 0.03)) * sdarc
                  ycurve <- sin(seq(0, pi/2, by = 0.03)) * sdarc
                  lines(xcurve, ycurve, col = "blue", lty = 3)
                }
            }
            if (show.gamma[1]) {
    # if the user has passed a set of gamma values, use that
                if (length(show.gamma) > 1) gamma <- show.gamma
    # otherwise make up a set
                else gamma <- pretty(c(0, maxsd), n = ngamma)[-1]
                if (gamma[length(gamma)] > maxsd) 
                  gamma <- gamma[-length(gamma)]
                labelpos <- seq(45, 70, length.out = length(gamma))
     # do the gamma curves
               for (gindex in 1:length(gamma)) {
                  xcurve <- cos(seq(0, pi, by = 0.03)) * gamma[gindex] + sd.r
     # find where to clip the curves
                  endcurve <- which(xcurve < 0)
                  endcurve <- ifelse(length(endcurve), min(endcurve) - 
                    1, 105)
                  ycurve <- sin(seq(0, pi, by = 0.03)) * gamma[gindex]
                  maxcurve <- xcurve * xcurve + ycurve * ycurve
                  startcurve <- which(maxcurve > maxsd * maxsd)
                  startcurve <- ifelse(length(startcurve), max(startcurve) + 
                    1, 0)
                  lines(xcurve[startcurve:endcurve], ycurve[startcurve:endcurve], 
                    col = gamma.col)
                  if (xcurve[labelpos[gindex]] > 0) 
                    boxed.labels(xcurve[labelpos[gindex]], ycurve[labelpos[gindex]], 
                      gamma[gindex], border = FALSE)
                }
            }
  # the outer curve for correlation
             xcurve <- cos(seq(0, pi/2, by = 0.01)) * maxsd
            ycurve <- sin(seq(0, pi/2, by = 0.01)) * maxsd
            lines(xcurve, ycurve)
            bigtickangles <- acos(seq(0.1, 0.9, by = 0.1))
            medtickangles <- acos(seq(0.05, 0.95, by = 0.1))
            smltickangles <- acos(seq(0.91, 0.99, by = 0.01))
            segments(cos(bigtickangles) * maxsd, sin(bigtickangles) * 
                maxsd, cos(bigtickangles) * 0.97 * maxsd, sin(bigtickangles) * 
                0.97 * maxsd)
            par(xpd = TRUE)
    # the inner curve for reference SD
            if (ref.sd) {
                xcurve <- cos(seq(0, pi/2, by = 0.01)) * sd.r
                ycurve <- sin(seq(0, pi/2, by = 0.01)) * sd.r
                lines(xcurve, ycurve)
            }
            points(sd.r, 0, cex = pcex)
            text(cos(c(bigtickangles, acos(c(0.95, 0.99)))) * 
                1.05 * maxsd, sin(c(bigtickangles, acos(c(0.95, 
                0.99)))) * 1.05 * maxsd, c(seq(0.1, 0.9, by = 0.1), 
                0.95, 0.99),cex=cex.axis)
            text(maxsd * 0.8, maxsd * 0.8, "Correlation", srt = 315,cex=cex.axis)
            segments(cos(medtickangles) * maxsd, sin(medtickangles) * 
                maxsd, cos(medtickangles) * 0.98 * maxsd, sin(medtickangles) * 
                0.98 * maxsd)
            segments(cos(smltickangles) * maxsd, sin(smltickangles) * 
                maxsd, cos(smltickangles) * 0.99 * maxsd, sin(smltickangles) * 
                0.99 * maxsd)
        }
        else {
            x <- ref
            y <- model
            R <- cor(x, y, use = "pairwise.complete.obs")
            E <- mean(x, na.rm = TRUE) - mean(y, na.rm = TRUE)
            xprime <- x - mean(x, na.rm = TRUE)
            yprime <- y - mean(y, na.rm = TRUE)
            sumofsquares <- (xprime - yprime)^2
            Eprime <- sqrt(sum(sumofsquares)/length(complete.cases(x)))
            E2 <- E^2 + Eprime^2
            if (add == FALSE) {
     # pourtour du diagramme (display the diagram)
               maxray <- 1.5 * max(sd.f, sd.r)
                plot(c(-maxray, maxray), c(0, maxray), type = "n", 
                  asp = 1, bty = "n", xaxt = "n", yaxt = "n", 
                  xlim=c(-1.1*maxray,1.1*maxray),
                  xlab = xlab, ylab = ylab, main = main, cex = cex.axis)
                discrete <- seq(180, 0, by = -1)
                listepoints <- NULL
                for (i in discrete) {
                  listepoints <- cbind(listepoints, maxray * 
                    cos(i * pi/180), maxray * sin(i * pi/180))
                }
                listepoints <- matrix(listepoints, 2, length(listepoints)/2)
                listepoints <- t(listepoints)
                lines(listepoints[, 1], listepoints[, 2])
     # axes x,y
               lines(c(-maxray, maxray), c(0, 0))
                lines(c(0, 0), c(0, maxray))
    # lignes radiales jusque R = +/- 0.8
                for (i in grad.corr.lines) {
                  lines(c(0, maxray * i), c(0, maxray * sqrt(1 - 
                    i^2)), lty = 3)
                  lines(c(0, -maxray * i), c(0, maxray * sqrt(1 - 
                    i^2)), lty = 3)
                }
   # texte radial
                 for (i in grad.corr.full) {
                  text(1.05 * maxray * i, 1.05 * maxray * sqrt(1 - 
                    i^2), i, cex = cex.axis,adj=cos(i)/2)
                  text(-1.05 * maxray * i, 1.05 * maxray * sqrt(1 - 
                    i^2), -i, cex = cex.axis,adj=1-cos(i)/2)
                }
      # sd concentriques autour de la reference
               seq.sd <- seq.int(0, 2 * maxray, by = (maxray/10))[-1]
                for (i in seq.sd) {
                  xcircle <- sd.r + (cos(discrete * pi/180) * 
                    i)
                  ycircle <- sin(discrete * pi/180) * i
                  for (j in 1:length(xcircle)) {
                    if ((xcircle[j]^2 + ycircle[j]^2) < (maxray^2)) {
                      points(xcircle[j], ycircle[j], col = "darkgreen", 
                        pch = ".")
                      if (j == 10) 
                        text(xcircle[j], ycircle[j], signif(i, 
                          2), cex = cex.axis, col = "darkgreen",srt=90)
                    }
                  }
                }
     # sd concentriques autour de l'origine
              seq.sd <- seq.int(0, maxray, length.out = 5)
                for (i in seq.sd) {
                  xcircle <- cos(discrete * pi/180) * i
                  ycircle <- sin(discrete * pi/180) * i
                  if (i) 
                    lines(xcircle, ycircle, lty = 3, col = "blue")
                  text(min(xcircle), -0.06 * maxray, signif(i, 
                    2), cex = cex.axis, col = "blue")
                  text(max(xcircle), -0.06 * maxray, signif(i, 
                    2), cex = cex.axis, col = "blue")
                }
                text(0, -0.14 * maxray, "Standard Deviation", 
                  cex = cex.axis, col = "blue")
                text(0, -0.22 * maxray, "Centered RMS Difference", 
                  cex = cex.axis, col = "darkgreen")
                points(sd.r, 0, pch = 22, bg = "darkgreen", cex = pcex)
                text(0, 1.2 * maxray, "Correlation Coefficient", 
                  cex = cex.axis)
            }
            S <- (2 * (1 + R))/(sd.f + (1/sd.f))^2
 #   Taylor<-S
       }
    }
 # display the points
    points(sd.f * R, sd.f * sin(acos(R)), pch = pch, col = col, 
        cex = pcex)
    invisible(oldpar)
}
