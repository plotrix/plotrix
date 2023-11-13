barNest<-function (formula = NULL, data = NULL, FUN = c("mean", "sd", 
    "sd", "valid.n"), ylim = NULL, main = "", xlab = "", ylab = "", 
    shrink = 0.1, errbars = FALSE, col = NA, labelcex = 1, lineht = NULL, 
    showall = TRUE, Nwidths = FALSE, barlabels = NULL, showlabels = TRUE, 
    mar = NULL, arrow.cap = NULL, trueval = TRUE) {

    if(inherits(data,"brklist")) x<-data
    else x <- brkdnNest(formula = formula, data = data, FUN = FUN, 
        trueval = trueval)
    getBreakListNames <- function(x) {
        blnames <- list(names(x[[1]][[1]]))
        for (level in 2:length(x[[1]])) blnames[[level]] <- dimnames(x[[1]][[level]])[[level - 
            1]]
        return(blnames)
    }
    if (is.null(barlabels)) barlabels <- getBreakListNames(x)
    xnames <- names(x)
    nbn <- length(as.character(attr(terms(formula), "variables")[-1]))
    if (FUN[1] == "valid.n" || FUN[1] == "sumbrk" || FUN[1] == 
        "sum") {
        if (is.null(ylim)) 
            ylim <- c(0, 1.04 * max(unlist(x[[1]][[2]]), na.rm = TRUE))
        if (FUN[1] == "valid.n" || FUN[1] == "sum") 
            barlabels[[1]] <- ""
    }
    intervals <- xnames[2] == xnames[3]
    if (is.null(ylim)) {
        if (errbars) {
            if (intervals) 
                ylim <- c(min(unlist(x[[1]]), na.rm = TRUE) - 
                  max(unlist(x[[3]]), na.rm = TRUE), max(unlist(x[[1]]), 
                  na.rm = TRUE) + max(unlist(x[[2]]), na.rm = TRUE))
            else ylim <- c(min(unlist(x[[3]]), na.rm = TRUE), 
                max(unlist(x[[2]]), na.rm = TRUE))
        }
        else ylim <- range(unlist(x[[1]]), na.rm = TRUE)
    }
    if (is.null(arrow.cap)) 
        arrow.cap <- 0.25/length(unlist(x[[1]]))
    ylim <- ylim + c(ifelse(ylim[1] < 0, -0.04, 0), 0.04) * diff(ylim)
    if (ylim[1] != 0) 
        ylim[1] <- 0
    if (!is.null(mar)) 
        oldmar <- par(mar = mar)
    plot(0, xlim = c(0, 1), ylim = ylim, main = main, xlab = xlab, 
        ylab = ylab, xaxt = "n", yaxs = "i", type = "n")
    parusr <- par("usr")
    if (is.null(lineht)) 
        lineht <- 1.05 * labelcex * diff(parusr[3:4]) * (par("mai")[1]/par("pin")[2])/par("mar")[1]
    nlevels = length(x[[1]])
    drawNestedBars(x, start = 0, end = 1, shrink = shrink, errbars = errbars, 
        intervals = intervals, col = col, labelcex = labelcex, 
        lineht = lineht, showall = showall, Nwidths = Nwidths, 
        barlabels = barlabels, showlabels = showlabels, arrow.cap = arrow.cap)
    abline(h = 0)
    if (FUN[1] == "valid.n") 
        box()
    if (!is.null(mar)) 
        par(mar = oldmar)
    invisible(x)
}
