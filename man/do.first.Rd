\name{do.first}
\alias{do.first}
\title{ Execute a graphic function on a plot }
\description{ do.first allows the user to execute one or more commands before
 displaying values on a plot. }
\details{
 \samp{do.first} is an argument in some plotrix functions that allows the user
 to do things like add a background color or a grid to the plot before
 displaying the other plot elements.

 The value of \samp{do.first} should be a character string that can be parsed
 to one or more valid R commands. Remember to enclose the string in quotes,
 separate commands with semicolons and escape quotes within the string with
 backslashes if necessary.
}
\keyword{misc}
