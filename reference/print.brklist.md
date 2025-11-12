# Display the output of brkdnNest

Displays the list of values produced by `brkdnNest`.

## Usage

``` r
# S3 method for class 'brklist'
print(x,...)
```

## Arguments

- x:

  a list of summary values produced by `\link{brkdnNest}`

- ...:

  additional arguments passed to `print`.

## Details

`print.brklist` displays frequency tables produced by `brkdnNest`. It is
mainly for convenience, but does make a nicer display than when passed
directly to `print`

## Value

nil

## Author

Jim Lemon

## See also

[brkdnNest](brkdnNest.md)

## Examples

``` r
 printbrktest<-data.frame(A=c(sample(1:10,99,TRUE),NA),
  B=sample(c("Yes","No"),100,TRUE),
  C=sample(LETTERS[1:3],100,TRUE))
 pbt<-brkdnNest(A~B+C,printbrktest)
 print(pbt)
#> mean 
#> Overall 5.424242 
#>   No 5.3125 
#>       A 5.5 
#>       B 5 
#>       C 5.4 
#>   Yes 5.529412 
#>       A 5.125 
#>       B 5.666667 
#>       C 5.75 
#> sd 
#> Overall 2.846734 
#>   No 2.88913 
#>       A 2.82162 
#>       B 2.908872 
#>       C 3.050453 
#>   Yes 2.830922 
#>       A 2.895399 
#>       B 2.716791 
#>       C 2.971354 
#> sd 
#> Overall 2.846734 
#>   No 2.88913 
#>       A 2.82162 
#>       B 2.908872 
#>       C 3.050453 
#>   Yes 2.830922 
#>       A 2.895399 
#>       B 2.716791 
#>       C 2.971354 
#> valid.n 
#> Overall 99 
#>   No 48 
#>       A 14 
#>       B 14 
#>       C 20 
#>   Yes 51 
#>       A 16 
#>       B 15 
#>       C 20 
```
