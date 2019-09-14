violin_plot<-function (X = rnorm(50),
              at,
              add = FALSE,
              na.rm = TRUE,
              bw,
              violin_width,
              violin_end_width = 0.005,
              equal_width = TRUE,
              show_box = TRUE,
              box_width = 0.01,
              box_col = "black",
              show_outliers = TRUE,
              outlier_pch = NA,
              range = 1.5,
              xlim,
              ylim,
              axes = TRUE,
              ann = TRUE,
              xlab = "",
              ylab = "",
              x_axis_labels,
              main = "Violin Plot",
              col = "red",
              median_col = "white",
              show_mean = FALSE,
              mean_pch = 19,
              mean_pch_col = "yellow",
              ...)
{
    if (missing(at)) at <- sequence(NCOL(X))
    if (missing(violin_width)) violin_width <- min(diff(c(0, at)))
    if (missing(xlim)) xlim <- c(min(at) - violin_width/2, max(at) + violin_width/2)
    if (missing(ylim)) ylim <- c(min(X, na.rm = TRUE), max(X, na.rm = TRUE))
    if (missing(x_axis_labels)) {
        if (is.null(names(X))) x_axis_labels <- at
        else x_axis_labels <- names(X)
    }
    if (length(col) != length(at)) {
        col <- rep(col, length.out = length(at))
    }
    if (!missing(bw)) bw <- rep(bw, length.out = length(at))
    if (add == FALSE) {
        plot(x = 1,
             y = 1,
             type = "n",
             xlim = xlim,
             ylim = ylim, 
             xlab = xlab,
             ylab = ylab,
             xaxt = "n",
             ann = ann,
             axes = axes)
    if (axes)
             axis(side = 1,
             at = at,
             labels = x_axis_labels)
    if(ann) title(main = main)
    }
    if (NCOL(X) == 1){
        if (missing(bw)) bw <- bw.nrd0(X)
        max_dy <- max(density(X, bw = bw, na.rm = na.rm, n = 2048)$y)
    }
    if (NCOL(X) > 1){
        if (missing(bw)) bw <- sapply(1:NCOL(X), function(i) bw.nrd0(X[,i]))
        for (i in 1:NCOL(X)) {
            max_dy <- max(sapply(1:NCOL(X), function(i) max(density(X[,i], bw = bw[i], na.rm = na.rm, n = 2048)$y)))
        }
    }
    for (i in 1:NCOL(X)) {
        if (NCOL(X) == 1) x <- X
        else x <- X[, i]
        if (na.rm == TRUE) x <- x[!is.na(x)]
        d <- density(x, bw = bw[i], n = 2048)
        b <- boxplot.stats(x, coef = range)        
        if (equal_width == FALSE) width_2 <- violin_width * max(d$y)/max_dy
        else width_2 <- violin_width		
        violin_y <- rescale(d$x, range(x))
        violin_x <- rescale(d$y, c(0, 0.48 * width_2))
        if (!show_outliers){
            ind1 <- findInterval(b$stats[1], violin_y)
            ind2 <- findInterval(b$stats[5], violin_y)
            violin_y <- violin_y[ind1:ind2]
            violin_x <- violin_x[ind1:ind2]
        }
        polygon(x = c(at[i] + violin_end_width * width_2, 
                      at[i] - violin_end_width * width_2,
                      at[i] - violin_x - violin_end_width * width_2,
                      at[i] - violin_end_width * width_2,
                      at[i] + violin_end_width * width_2,
                      rev(at[i] + violin_x + violin_end_width * width_2)),
                y = c(min(violin_y),
                      min(violin_y), 
                      violin_y,
                      max(violin_y),
                      max(violin_y),
                      rev(violin_y)), 
                col = col[i], ...)
        if (show_box){
          lines(x = c(at[i], at[i]),
                y = b$stats[1:2],
                lwd = 1,
                lend = "butt")
          lines(x = c(at[i], at[i]),
                y = b$stats[4:5],
                lwd = 1,
                lend = "butt")
          polygon(x = c(at[i] - box_width * violin_width,
                      at[i] + box_width * violin_width,
                      at[i] + box_width * violin_width, 
                      at[i] - box_width * violin_width),
                  y = c(b$stats[2], 
                      b$stats[2],
                      b$stats[4],
                      b$stats[4]),
                  col = box_col)
          lines(x = c(at[i] - box_width * violin_width,
                      at[i] + box_width * violin_width),
                y = c(b$stats[3],
                      b$stats[3]),
                lwd = 4,
                lend = "butt",
                col = median_col)
        }
        if (show_mean)
         points(x = at[i], y = mean(x), pch = mean_pch, col = mean_pch_col)
        if (show_outliers)
         points(x = rep(at[i], length(b$out)), y = b$out, pch = outlier_pch)
    }
}
