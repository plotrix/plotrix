## Focused regression tests for argument-handling fixes.
##
## These tests exercise the public plotting API for two defects:
##   1. brkdn.plot() with a two-term formula such as `a ~ group` (no `obs`
##      term) used to crash with "argument is of length zero" because the
##      formula handler set `obs` to NA_character_ and downstream branches
##      used `is.na(obs)` / `is.na(xlab)` on arguments that default to NULL.
##   2. histStack() used `length(legend.pos > 1)`, which routes a single
##      keyword such as "topright" into the coordinate branch and breaks
##      the call.
##
## The tests intentionally avoid brittle visual assertions: they only check
## that the calls run to completion and produce values with the documented
## structure / dimensions. Plots are sent to a throwaway PDF device so the
## tests can run headless under R CMD check.

library(plotrix)

pdf(file = tempfile(fileext = ".pdf"))
on.exit(dev.off(), add = TRUE)

## ---------------------------------------------------------------------------
## brkdn.plot: two-term formula
## ---------------------------------------------------------------------------
test.df <- data.frame(a = rnorm(80) + 4, b = rnorm(80) + 4,
                      c = rep(LETTERS[1:4], each = 20),
                      d = rep(rep(letters[1:4], each = 4), 5))

## A two-term formula `a ~ c` must not error. It must produce a result with
## one row per group and one column (the single variable), per the
## documented semantics ("if obs is NULL, the rows will be the groups and
## the columns the vars").
bp_two <- brkdn.plot(a ~ c, data = test.df)
stopifnot(is.list(bp_two), length(bp_two) == 2L)
stopifnot(identical(dim(bp_two[[1]]), c(4L, 1L)))
## the means per group must equal tapply's means (sanity check on values)
ref_means <- as.numeric(tapply(test.df$a, test.df$c, mean))
stopifnot(all.equal(as.numeric(bp_two[[1]]), ref_means, tolerance = 1e-8))

## The default xlab for this path is "Variable"; just ensure the call
## succeeds without the user having to pass xlab (this is the exact
## regression - xlab defaults to NULL and `is.na(NULL)` used to crash).
stopifnot(inherits(try(brkdn.plot(a ~ c, data = test.df), silent = TRUE),
                   "list"))

## ---------------------------------------------------------------------------
## brkdn.plot: regression - three-term formula still works
## ---------------------------------------------------------------------------
bp_three <- brkdn.plot(a ~ c + d, data = test.df)
stopifnot(identical(dim(bp_three[[1]]), c(4L, 4L)))

## ---------------------------------------------------------------------------
## brkdn.plot: regression - string API with both factors still works
## ---------------------------------------------------------------------------
bp_str <- brkdn.plot("a", "c", "d", test.df)
stopifnot(identical(dim(bp_str[[1]]), c(4L, 4L)))

## ---------------------------------------------------------------------------
## brkdn.plot: regression - multiple vars broken down by groups (no obs)
## exercises the adjacent `is.null(xlab)` branch that used to use is.na().
## ---------------------------------------------------------------------------
bp_multi <- brkdn.plot(c("a", "b"), "c", data = test.df)
stopifnot(identical(dim(bp_multi[[1]]), c(4L, 2L)))

## ---------------------------------------------------------------------------
## histStack: legend.pos routing
## ---------------------------------------------------------------------------
df <- data.frame(len = rnorm(100) + 5,
                 grp = factor(sample(c("A", "B", "C", "D"), 100,
                                     replace = TRUE)))

## A single keyword must route to legend(x, ...) and run without error.
## histStack returns NULL invisibly, so we check the call did not error.
stopifnot(!inherits(try(histStack(len ~ grp, data = df,
                                  legend.pos = "topright"),
                        silent = TRUE), "try-error"))

## A length-2 numeric vector must route to legend(x, y, ...) and run.
stopifnot(!inherits(try(histStack(len ~ grp, data = df,
                                  legend.pos = c(2.8, 18)),
                        silent = TRUE), "try-error"))

## No legend at all still works.
stopifnot(!inherits(try(histStack(len ~ grp, data = df),
                        silent = TRUE), "try-error"))

cat("regression-tests.R: all assertions passed\n")
