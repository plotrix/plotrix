# Paste the columns of a matrix together

Paste the columns of a matrix together to form as many "words" as there
are columns.

## Usage

``` r
pasteCols(x,sep="")
```

## Arguments

- x:

  A matrix.

- sep:

  The separator to use in the `paste` command.

## Details

`pasteCols` pastes the columns of a matrix together to form a vector in
which each element is the concatenation of the elements in each of the
columns of the matrix. It is intended for producing identifiers from a
matrix returned by the `combn` function.

## Value

A vector of character strings.

## Author

Jim Lemon

## See also

[makeIntersectList](makeIntersectList.md)

## Examples

``` r
 # create a matrix of the combinations of the first five letters of the
 # alphabet taken two at a time.
 alpha5<-combn(LETTERS[1:5],2,simplify=TRUE)
 pasteCols(alpha5,sep="+")
#>  [1] "A+B" "A+C" "A+D" "A+E" "B+C" "B+D" "B+E" "C+D" "C+E" "D+E"
```
