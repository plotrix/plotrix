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
#> Overall 5.313131 
#>   No 5.55102 
#>       A 6.111111 
#>       B 4.285714 
#>       C 6.038462 
#>   Yes 5.08 
#>       A 5.733333 
#>       B 4.571429 
#>       C 4.952381 
#> sd 
#> Overall 2.848725 
#>   No 2.799265 
#>       A 2.848001 
#>       B 2.672612 
#>       C 2.734678 
#>   Yes 2.905589 
#>       A 2.491892 
#>       B 3.005489 
#>       C 3.153985 
#> sd 
#> Overall 2.848725 
#>   No 2.799265 
#>       A 2.848001 
#>       B 2.672612 
#>       C 2.734678 
#>   Yes 2.905589 
#>       A 2.491892 
#>       B 3.005489 
#>       C 3.153985 
#> valid.n 
#> Overall 99 
#>   No 49 
#>       A 9 
#>       B 14 
#>       C 26 
#>   Yes 50 
#>       A 15 
#>       B 14 
#>       C 21 
```
