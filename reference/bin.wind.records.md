# Classify wind direction and speed records

Classifies wind direction and speed records into a matrix of percentages
of observations in speed and direction bins.

## Usage

``` r
bin.wind.records(winddir,windspeed,ndir=8,radians=FALSE,
  speed.breaks=c(0,10,20,30))
```

## Arguments

- winddir:

  A vector of wind directions.

- windspeed:

  A vector of wind speeds corresponding to the above directions.

- ndir:

  Number of direction bins in a compass circle.

- radians:

  Whether wind directions are in radians.

- speed.breaks:

  Minimum wind speed for each speed bin.

## Details

`bin.wind.records` bins a number of wind direction and speed records
into a matrix of percentages of observations that can be used to display
a cumulative wind rose with `oz.windrose` The defaults are those used by
the Australian Bureau of Meteorology.

## Value

A matrix of percentages in which the rows represent wind speed
categories and the columns represent wind direction categories.

## Author

Jim Lemon

## See also

[oz.windrose](oz.windrose.md)

## Examples

``` r
 winddir<-sample(0:360,100,TRUE)
 windspeed<-sample(0:40,100,TRUE)
 bin.wind.records(winddir,windspeed)
#>      [,1] [,2] [,3] [,4] [,5] [,6] [,7] [,8]
#> [1,]    0    1    3    1    1    1    0    3
#> [2,]    3    4    2    1    3    0    5    2
#> [3,]    4    0    4    4    2    4    2    3
#> [4,]    1    3    0    1    2    2    3    7
#> [5,]    3    4    3    2    6    3    3    4
```
