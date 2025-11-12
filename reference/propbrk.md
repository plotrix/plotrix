# Calculate the proportion of specified values in a vector

Calculates the proportion of values in a vector that are equal to a
specified value.

## Usage

``` r
propbrk(x,trueval=TRUE,na.rm=TRUE)
```

## Arguments

- x:

  a character, factor or numeric vector.

- trueval:

  the value to be matched in `x`.

- na.rm:

  whether to remove NA values.

## Details

`propbrk` calculates the proportion of values matching a specified
value. It is mainly to allow proportions to be calculated in the
`brkdnNest` function. It always discards NAs in `x` when summing the
number equal to `trueval`, but respects the `na.rm` argument when
calculating the total number of values in `x`.

## Value

nil

## Author

Jim Lemon

## See also

[brkdnNest](brkdnNest.md)

## Examples

``` r
 propbrk(sample(LETTERS,100,TRUE),trueval="M")
#> [1] 0.05
```
