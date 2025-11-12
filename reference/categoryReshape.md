# Convert object label/attribute label coding.

Convert object label/attribute label coding to an object by attribute
data frame.

## Usage

``` r
categoryReshape(x)
```

## Arguments

- x:

  A matrix or data frame with at least two columns.

## Details

`categoryReshape` attempts to convert the first two columns of its input
into a data frame in which rows represent objects and columns
attributes. For each object, a value of 1 indicates that the object has
that attribute, and a value of 0 that it does not. In set membership
terms, a 1 indicates that the object is a member of that set and a 0
that it is not.

## Value

A data frame (see Details).

## Author

Jim Lemon

## See also

[makeIntersectList](makeIntersectList.md)

## Examples

``` r
 ns<-sample(1:8,20,TRUE)
 objects<-0
 for(i in 1:length(ns)) objects<-c(objects,rep(i,ns[i]))
 attributes<-"Z"
 for(i in 1:length(ns)) attributes<-c(attributes,sample(LETTERS[1:8],ns[i]))
 setdf<-data.frame(objects[-1],attributes[-1])
 categoryReshape(setdf)
#>    A B C D E F G H
#> 1  1 0 1 0 1 1 0 0
#> 2  0 1 0 0 0 0 1 1
#> 3  0 0 1 1 1 1 1 1
#> 4  0 1 0 0 0 0 0 0
#> 5  1 1 1 1 1 1 0 1
#> 6  0 0 0 0 0 1 0 0
#> 7  1 1 1 1 1 0 0 0
#> 8  1 1 1 1 1 1 1 0
#> 9  0 1 1 1 1 1 1 1
#> 10 1 1 1 1 1 1 1 1
#> 11 0 1 1 1 1 1 0 1
#> 12 1 1 1 1 1 1 0 1
#> 13 0 1 0 0 0 0 0 0
#> 14 1 0 1 1 1 1 0 0
#> 15 1 0 1 1 0 1 0 0
#> 16 0 1 1 1 1 1 1 1
#> 17 0 1 1 1 0 0 1 1
#> 18 0 0 0 0 1 0 1 0
#> 19 1 0 0 0 1 0 0 0
#> 20 1 1 0 1 0 1 1 0
```
