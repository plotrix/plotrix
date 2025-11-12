# Count specified values in a vector

Counts the number of values in a vector that are equal to a specified
value.

## Usage

``` r
sumbrk(x,trueval=TRUE,na.rm=TRUE)
```

## Arguments

- x:

  a character, factor or numeric vector.

- trueval:

  the value to be matched in `x`.

- na.rm:

  whether to remove NA values.

## Details

`sumbrk` counts the values in `x` matching a specified value. It is
mainly to allow these sums to be calculated in the `brkdnNest` function.

## Value

nil

## Author

Jim Lemon

## See also

[brkdnNest](brkdnNest.md)

## Examples

``` r
 sumbrk(sample(LETTERS,100,TRUE),trueval="M")
#> [1] 5
```
