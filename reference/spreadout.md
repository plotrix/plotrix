# Spread out a vector of numbers to a minimum interval

Spread out a vector of numbers so that there is a minimum interval
between any two numbers when in ascending or descending order.

## Usage

``` r
spreadout(x,mindist)
```

## Arguments

- x:

  A numeric vector which may contain NAs.

- mindist:

  The minimum interval between any two values when in ascending or
  descending order.

## Details

`spreadout` starts at or near the middle of the vector and increases the
intervals between the ordered values. NAs are preserved. `spreadout`
first tries to spread groups of values with intervals less than
`mindist` out neatly away from the mean of the group. If this doesn't
entirely succeed, a second pass that forces values away from the middle
is performed.

`spreadout` is currently used to avoid overplotting of axis tick labels
where they may be close together.

## Value

On success, the spread out values. If there are less than two valid
values, the original vector is returned.

## Author

Jim Lemon

## Examples

``` r
 spreadout(c(1,3,3,3,3,5),0.2)
#> [1] 1.0 2.7 2.9 3.1 3.3 5.0
 spreadout(c(1,2.5,2.5,3.5,3.5,5),0.2)
#> [1] 1.0 2.4 2.6 3.4 3.6 5.0
 spreadout(c(5,2.5,2.5,NA,3.5,1,3.5,NA),0.2)
#> [1] 5.0 2.4 2.6  NA 3.4 1.0 3.6  NA
 # this will almost always invoke the brute force second pass
 spreadout(rnorm(10),0.5)
#>  [1] -0.2091734 -1.7091734  1.7908266 -0.7091734  1.2908266  0.2908266
#>  [7]  2.2908266  2.7908266 -1.2091734  0.7908266
```
