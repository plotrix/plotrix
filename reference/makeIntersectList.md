# Count set intersections

Create a list of set intersections from a matrix of indicators

## Usage

``` r
makeIntersectList(x,xnames=NULL,sep="+")
```

## Arguments

- x:

  A data frame or matrix where rows represent objects and columns
  attributes. A `1` or `TRUE` indicates that the object (row) has that
  attribute or is a member of that set (column). `x` can also be a
  matrix or data frame in which the first column contains object
  identifiers and the second contains attribute codes.

- xnames:

  Optional user-supplied names for the attributes of x.

- sep:

  A character to use as a separator for attribute labels.

## Details

`makeIntersectList` reads a matrix (or data frame where all values are
the same type) containing dichotomous values (either 0/1 or FALSE/TRUE)
or labels (see next paragraph). In the first type of input, each row
represents an object and each column represents a set. A value of 1 or
TRUE indicates that that object is a member of that set. The function
creates a list of vectors that correspond to all combinations of the
sets (set intersections) and inserts the counts of elements in each
combination. If a row of `x` is all zeros, it will not be counted, but
the second last element of the list returned contains the count of rows
in `x` and thus non-members can be calculated.

If a matrix (or data frame where all values are the same type)
containing values other than 0/1 or TRUE/FALSE, it will be passed to
`categoryReshape` for conversion to a data frame as described above. See
`categoryReshape` for details of this.

makeIntersectList combines the set or attribute names to form
intersection names. For the intersection of sets A and B, the name will
be A+B (unless `sep` is changed) and so on. These are the names that
will be displayed by `intersectDiagram`. To change these, use the
`xnames` argument.

## Value

A list of the intersection counts or percentages, the total number of
objects and the attribute codes.

## Author

Jim Lemon

## See also

[intersectDiagram](intersectDiagram.md),
[pasteCols](pasteCols.md),[categoryReshape](categoryReshape.md)

## Examples

``` r
 # create a matrix where each row represents an element and
 # a 1 (or TRUE) in each column indicates that the element is a member
 # of that set.
 setdf<-data.frame(A=sample(c(0,1),100,TRUE,prob=c(0.7,0.3)),
  B=sample(c(0,1),100,TRUE,prob=c(0.7,0.3)),
  C=sample(c(0,1),100,TRUE,prob=c(0.7,0.3)),
  D=sample(c(0,1),100,TRUE,prob=c(0.7,0.3)))
 makeIntersectList(setdf)
#> [[1]]
#> 0+1 
#>   2 
#> 
#> [[2]]
#> Total 
#>     2 
#> 
#> [[3]]
#> attributes       <NA> 
#>        "0"        "1" 
#> 
#> attr(,"class")
#> [1] "intersectList"
 ns<-sample(1:8,20,TRUE)
 objects<-0
 for(i in 1:length(ns)) objects<-c(objects,rep(i,ns[i]))
 attributes<-"Z"
 for(i in 1:length(ns)) attributes<-c(attributes,sample(LETTERS[1:8],ns[i]))
 setdf2<-data.frame(objects[-1],attributes[-1])
 makeIntersectList(setdf2)
#> [[1]]
#> A B C D E F G H 
#> 0 0 0 0 0 1 0 0 
#> 
#> [[2]]
#> A+B A+C A+D A+E A+F A+G A+H B+C B+D B+E B+F B+G B+H C+D C+E C+F C+G C+H D+E D+F 
#>   0   0   0   0   0   0   0   0   0   1   0   1   1   0   0   0   0   0   0   0 
#> D+G D+H E+F E+G E+H F+G F+H G+H 
#>   0   0   0   0   0   0   0   0 
#> 
#> [[3]]
#> A+B+C A+B+D A+B+E A+B+F A+B+G A+B+H A+C+D A+C+E A+C+F A+C+G A+C+H A+D+E A+D+F 
#>     0     0     0     0     0     0     0     0     0     0     0     0     0 
#> A+D+G A+D+H A+E+F A+E+G A+E+H A+F+G A+F+H A+G+H B+C+D B+C+E B+C+F B+C+G B+C+H 
#>     0     0     0     0     0     1     0     0     0     0     0     0     0 
#> B+D+E B+D+F B+D+G B+D+H B+E+F B+E+G B+E+H B+F+G B+F+H B+G+H C+D+E C+D+F C+D+G 
#>     0     0     0     0     0     0     0     0     0     0     1     0     0 
#> C+D+H C+E+F C+E+G C+E+H C+F+G C+F+H C+G+H D+E+F D+E+G D+E+H D+F+G D+F+H D+G+H 
#>     0     0     0     0     0     0     0     0     0     0     0     0     0 
#> E+F+G E+F+H E+G+H F+G+H 
#>     0     0     0     0 
#> 
#> [[4]]
#> A+B+C+D A+B+C+E A+B+C+F A+B+C+G A+B+C+H A+B+D+E A+B+D+F A+B+D+G A+B+D+H A+B+E+F 
#>       0       0       0       0       0       1       0       0       0       0 
#> A+B+E+G A+B+E+H A+B+F+G A+B+F+H A+B+G+H A+C+D+E A+C+D+F A+C+D+G A+C+D+H A+C+E+F 
#>       0       1       0       1       0       0       0       0       0       0 
#> A+C+E+G A+C+E+H A+C+F+G A+C+F+H A+C+G+H A+D+E+F A+D+E+G A+D+E+H A+D+F+G A+D+F+H 
#>       0       0       0       0       0       0       0       0       0       0 
#> A+D+G+H A+E+F+G A+E+F+H A+E+G+H A+F+G+H B+C+D+E B+C+D+F B+C+D+G B+C+D+H B+C+E+F 
#>       0       0       0       0       0       0       0       0       0       0 
#> B+C+E+G B+C+E+H B+C+F+G B+C+F+H B+C+G+H B+D+E+F B+D+E+G B+D+E+H B+D+F+G B+D+F+H 
#>       0       0       0       0       0       0       0       0       0       0 
#> B+D+G+H B+E+F+G B+E+F+H B+E+G+H B+F+G+H C+D+E+F C+D+E+G C+D+E+H C+D+F+G C+D+F+H 
#>       0       0       0       0       0       0       0       0       0       0 
#> C+D+G+H C+E+F+G C+E+F+H C+E+G+H C+F+G+H D+E+F+G D+E+F+H D+E+G+H D+F+G+H E+F+G+H 
#>       0       0       0       0       0       0       0       0       0       0 
#> 
#> [[5]]
#> A+B+C+D+E A+B+C+D+F A+B+C+D+G A+B+C+D+H A+B+C+E+F A+B+C+E+G A+B+C+E+H A+B+C+F+G 
#>         0         0         0         0         0         0         0         0 
#> A+B+C+F+H A+B+C+G+H A+B+D+E+F A+B+D+E+G A+B+D+E+H A+B+D+F+G A+B+D+F+H A+B+D+G+H 
#>         0         0         0         0         0         0         0         0 
#> A+B+E+F+G A+B+E+F+H A+B+E+G+H A+B+F+G+H A+C+D+E+F A+C+D+E+G A+C+D+E+H A+C+D+F+G 
#>         0         0         0         1         0         0         0         0 
#> A+C+D+F+H A+C+D+G+H A+C+E+F+G A+C+E+F+H A+C+E+G+H A+C+F+G+H A+D+E+F+G A+D+E+F+H 
#>         0         0         0         0         0         0         0         1 
#> A+D+E+G+H A+D+F+G+H A+E+F+G+H B+C+D+E+F B+C+D+E+G B+C+D+E+H B+C+D+F+G B+C+D+F+H 
#>         0         0         0         0         0         0         0         0 
#> B+C+D+G+H B+C+E+F+G B+C+E+F+H B+C+E+G+H B+C+F+G+H B+D+E+F+G B+D+E+F+H B+D+E+G+H 
#>         0         0         0         0         0         0         0         0 
#> B+D+F+G+H B+E+F+G+H C+D+E+F+G C+D+E+F+H C+D+E+G+H C+D+F+G+H C+E+F+G+H D+E+F+G+H 
#>         0         0         0         0         0         0         0         0 
#> 
#> [[6]]
#> A+B+C+D+E+F A+B+C+D+E+G A+B+C+D+E+H A+B+C+D+F+G A+B+C+D+F+H A+B+C+D+G+H 
#>           0           0           0           0           0           0 
#> A+B+C+E+F+G A+B+C+E+F+H A+B+C+E+G+H A+B+C+F+G+H A+B+D+E+F+G A+B+D+E+F+H 
#>           0           0           1           0           0           0 
#> A+B+D+E+G+H A+B+D+F+G+H A+B+E+F+G+H A+C+D+E+F+G A+C+D+E+F+H A+C+D+E+G+H 
#>           0           0           0           1           0           0 
#> A+C+D+F+G+H A+C+E+F+G+H A+D+E+F+G+H B+C+D+E+F+G B+C+D+E+F+H B+C+D+E+G+H 
#>           0           0           0           0           0           0 
#> B+C+D+F+G+H B+C+E+F+G+H B+D+E+F+G+H C+D+E+F+G+H 
#>           0           0           0           0 
#> 
#> [[7]]
#> A+B+C+D+E+F+G A+B+C+D+E+F+H A+B+C+D+E+G+H A+B+C+D+F+G+H A+B+C+E+F+G+H 
#>             0             1             0             0             1 
#> A+B+D+E+F+G+H A+C+D+E+F+G+H B+C+D+E+F+G+H 
#>             1             0             1 
#> 
#> [[8]]
#> A+B+C+D+E+F+G+H 
#>               3 
#> 
#> [[9]]
#> Total 
#>    20 
#> 
#> [[10]]
#> attributes       <NA>       <NA>       <NA>       <NA>       <NA>       <NA> 
#>        "A"        "B"        "C"        "D"        "E"        "F"        "G" 
#>       <NA> 
#>        "H" 
#> 
#> attr(,"class")
#> [1] "intersectList"
```
