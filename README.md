# MMDS
**M**odified **M**ulti-**D**imensional **S**caling Algorithm.

## Description
This package is an implementation of Modified Multi-Dimensional Scaling Algorithm.

## Installation
Install `MMDS` from GitHub:

```r
install.packages("devtools")
library(devtools)
devtools::install_github("chenqi57/MMDS")
library(mmds)
```
or directly from the `MMDS_1.0.1.tar.gz`:
```r
install.packages("MMDS_1.0.1.tar.gz", repos = NULL, type = "source")
library(mmds)
```
## Functions

Three functions are contained in this package, where two functions are the implementation of the MMDS algorithm.

* `eigen_centered`: Center the sample *X* to *Y* and return ![equation](http://www.sciweavers.org/upload/Tex2Img_1609356433/render.png)
* `MMDS`: Modified Multi-Dimensional Scaling Algorithm using eigen-decompision methods provided by R.
* `MMDS`: Modified Multi-Dimensional Scaling Algorithm using eigen-decompision methods provided by C++.

## Documentation

Documentations of the above functions can be accesed by typing `?` before each function's name at the R command. 
For instance, the user can read the function `MMDS`'s argument, output and examples in detail by typing `?MMDS`.
