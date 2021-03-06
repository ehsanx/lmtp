% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/data.R
\docType{data}
\name{sim_t4}
\alias{sim_t4}
\title{Simulated Longitudinal Data}
\format{
A data frame with 5000 rows and 10 variables:
\describe{
\item{ID}{observation ID}
\item{L_1}{Time varying covariate time 1}
\item{A_1}{Treatment node at time 1, effected by L_1}
\item{L_2}{Time varying covariate time 1, effected by L_1 and A_1}
\item{A_2}{Treatment node at time 2, effected by L_2 and A_1}
\item{L_3}{Time varying covariate time 1, effected by L_2 and A_2}
\item{A_3}{Treatment node at time 3, effected by L_3 and A_2}
\item{L_4}{Time varying covariate time 1, effected by L_3 and A_3}
\item{A_4}{Treatment node at time 3, effected by L_4 and A_3}
\item{Y}{Binary outcome at time 5, effected by L_4 and A_4}
}
}
\usage{
sim_t4
}
\description{
A dataset with a binary outcome, four time varying treatment nodes,
and four time varying covariates.
}
\keyword{datasets}
