# Slice an array

Slices one dimension from an array by taking one element from the first
dimension.

## Usage

``` r
sliceArray(x,slice)
```

## Arguments

- x:

  An array

- slice:

  The index of the slice to take from the first dimension of the array.

## Details

`sliceArray` builds an extractor string containing the value of `slice`
as the first element and as many commas as needed to match the
dimensions of the array. It then applies the extractor function to `x`
and returns the result. Note how the array "slice" swaps dimensions in
the example.

## Value

The desired slice of the array.

## Author

Jim Lemon

## See also

[array](https://rdrr.io/r/base/array.html)

## Examples

``` r
 a1<-array(1:27,dim=c(3,3,3))
 a1
#> , , 1
#> 
#>      [,1] [,2] [,3]
#> [1,]    1    4    7
#> [2,]    2    5    8
#> [3,]    3    6    9
#> 
#> , , 2
#> 
#>      [,1] [,2] [,3]
#> [1,]   10   13   16
#> [2,]   11   14   17
#> [3,]   12   15   18
#> 
#> , , 3
#> 
#>      [,1] [,2] [,3]
#> [1,]   19   22   25
#> [2,]   20   23   26
#> [3,]   21   24   27
#> 
 sliceArray(a1,2)
#>      [,1] [,2] [,3]
#> [1,]    2   11   20
#> [2,]    5   14   23
#> [3,]    8   17   26
```
