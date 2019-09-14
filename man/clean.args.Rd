\name{clean.args}
\alias{clean.args}
\alias{remove.args}
\title{Remove inappropriate arguments from an argument list}
\description{
 Takes a list of arguments and eliminates those that are not
  appropriate for passing to a particular function (and hence
  would produce an error if passed).
}
\usage{
 clean.args(argstr,fn,exclude.repeats=FALSE,exclude.other=NULL,dots.ok=TRUE)
 remove.args(argstr,fn)
}
\arguments{
 \item{argstr}{a named list of arguments, e.g. from \samp{\dots}}
 \item{fn}{a function}
 \item{exclude.repeats}{(logical) remove repeated arguments?}
 \item{exclude.other}{a character vector of names of additional arguments to remove}
 \item{dots.ok}{should "..." be allowed in the argument list?}
}
\value{
 \samp{clean.args} returns a list which is a copy of \samp{argstr} with
 arguments inappropriate for \samp{fn} removed; \samp{remove.args}
 removes the arguments for \samp{fn} from the list.
}
\author{Ben Bolker}
\examples{
 tststr <- list(n=2,mean=0,sd=1,foo=4,bar=6) 
 clean.args(tststr,rnorm)
 try(do.call("rnorm",tststr))
 do.call("rnorm",clean.args(tststr,rnorm))
 remove.args(tststr,rnorm)
 ## add example of combining arg. lists?
}
\keyword{programming}
