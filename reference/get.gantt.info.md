# Gather the information to create a Gantt chart

Allows the user to enter the information for a Gantt chart.

## Usage

``` r
get.gantt.info(format="%Y/%m/%d")
```

## Arguments

- format:

  the format to be used in entering dates/times. Defaults to YYYY/mm/dd.
  See [strptime](https://rdrr.io/r/base/strptime.html) for various
  date/time formats.

## Value

The list used to create the chart. Elements are:

- labels:

  The task labels to be displayed at the left of the chart.

- starts,ends:

  The task starts/ends as POSIXct dates/times.

- priorities:

  Task priorities as integers in the range 1 to 10. There can be less
  than 10 levels of priority, but if priorities do not start at 1
  (assumed to be the highest), the default priority colors will be
  calculated from 1.

## Author

Jim Lemon

## See also

[gantt.chart](gantt.chart.md)

## Examples

``` r
 cat("Enter task times using HH:MM (hour:minute) format\n")
#> Enter task times using HH:MM (hour:minute) format
 get.gantt.info("%H:%M")
#> Enter the label, start and finish time for each task.
#> Default format for time is year/month/day e.g. 2005/2/22
#> Enter a blank label to end.
#> Task label - 
#> $labels
#> [1] NA
#> 
#> $starts
#> [1] NA
#> 
#> $ends
#> [1] NA
#> 
#> $priorities
#> [1] NA
#> 
```
