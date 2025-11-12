# Remove inappropriate arguments from an argument list

Takes a list of arguments and eliminates those that are not appropriate
for passing to a particular function (and hence would produce an error
if passed).

## Usage

``` r
clean.args(argstr,fn,exclude.repeats=FALSE,exclude.other=NULL,dots.ok=TRUE)
 remove.args(argstr,fn)
```

## Arguments

- argstr:

  a named list of arguments, e.g. from `\dots`

- fn:

  a function

- exclude.repeats:

  (logical) remove repeated arguments?

- exclude.other:

  a character vector of names of additional arguments to remove

- dots.ok:

  should "..." be allowed in the argument list?

## Value

`clean.args` returns a list which is a copy of `argstr` with arguments
inappropriate for `fn` removed; `remove.args` removes the arguments for
`fn` from the list.

## Author

Ben Bolker

## Examples

``` r
 tststr <- list(n=2,mean=0,sd=1,foo=4,bar=6) 
 clean.args(tststr,rnorm)
#> $n
#> [1] 2
#> 
#> $mean
#> [1] 0
#> 
#> $sd
#> [1] 1
#> 
 try(do.call("rnorm",tststr))
#> Error in rnorm(n = 2, mean = 0, sd = 1, foo = 4, bar = 6) : 
#>   unused arguments (foo = 4, bar = 6)
 do.call("rnorm",clean.args(tststr,rnorm))
#> [1]  1.061975 -2.725278
 remove.args(tststr,rnorm)
#> $foo
#> [1] 4
#> 
#> $bar
#> [1] 6
#> 
 ## add example of combining arg. lists?
```
