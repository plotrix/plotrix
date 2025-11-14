## 3.8-13

  - Fixes CRAN issues:  URL moved, width of usage.

## 3.8-12

This is a fairly minor bug fix release.  It also adds a few 
options to the `gap.plot()` function.  Here's the news:

  - Fixed warnings in `gap.plot()` when there were 2 gaps.
  
  - Fixed `pie3D()` which skipped very small slices (issue #9).
  - Fixed `polar.plot()` which put labels in the wrong place (PR #8).
  
  - Fixed `plotCI()` to allow `pch` to be a vector (PR #11).
  
  - Added arguments to `gap.plot()` to support non-standard
  box types (PR #17).

  - Added pkgdown site at https://plotrix.github.io/plotrix/
  
  - Changed `Authors` to more descriptive `Authors@R`.
