
<!-- README.md is generated from README.Rmd. Please edit that file -->

# lmtp

<!-- badges: start -->

[![Build
Status](https://travis-ci.com/nt-williams/lmtp.svg?token=DA4a53nWMx6q9LisKdRD&branch=master)](https://travis-ci.com/nt-williams/lmtp)
[![codecov](https://codecov.io/gh/nt-williams/lmtp/branch/master/graph/badge.svg?token=TFQNTischL)](https://codecov.io/gh/nt-williams/lmtp)
<!-- badges: end -->

> Non-parametric Causal Effects Based on Longitudinal Modified Treatment
> Policies

# Installation

The development version can be installed from GitHub with:

``` r
devtools::install_github("nt-williams/lmtp")
```

# Example

We’re interested in the effect of an intervention where exposure is
decreased by 1 at all time points for observations whose exposure won’t
go below 0 if shifted on the outcome Y. The true value under this
intervention is about 0.48.

![](https://gist.githubusercontent.com/nt-williams/2488fef9e94c7ef1a3920c2682433980/raw/3511d78d0c47ba30099fe428088751446cbbaa60/lmtp-readme-example.svg?sanitize=true)
