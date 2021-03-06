
#' Create a node list specification
#'
#' Creates a node list specification that is used by the provided estimators.
#' \code{create_node_list()} is not explicitly called by the analyst, rather
#' it is provided so the analyst can confirm how estimators will use variables
#' before actually performing the estimation procedure.
#'
#' @param trt A vector of column names of treatment variables.
#' @param tau The number of time points of observation, excluding the final outcome.
#' @param time_vary A list of length tau with the column names for new time_vary to
#'  be introduced at each time point. The list should be ordered following
#'  the time ordering of the model.
#' @param baseline An optional vector of columns names for baseline covariates to be
#'  included for adjustment at every timepoint.
#' @param k An integer specifying how previous time points should be
#'  used for estimation at the given time point. Default is \code{Inf},
#'  all time points.
#'
#' @return A list the same length of the time_vary parameter with the variables
#' to be used for estimation at that given time point.
#' @export
#' @examples
#' a <- c("A_1", "A_2", "A_3", "A_4")
#' bs <- c("W_1", "W_2")
#' time_vary <- list(c("L_1"), c("L_2"), c("L_3"), c("L_4"))
#'
#' # assuming no Markov property
#' create_node_list(a, 4, time_vary, bs, k = Inf)
#'
#' # assuming a Markov property
#' create_node_list(a, 4, time_vary, bs, k = 0)
create_node_list <- function(trt, tau, time_vary = NULL, baseline = NULL, k = Inf) {
  if (is.null(k)) {
    k <- Inf
  }

  out <- list(trt = trt_node_list(trt, time_vary, baseline, k, tau),
              outcome = outcome_node_list(trt, time_vary, baseline, k, tau))

  return(out)
}

trt_node_list <- function(trt, time_vary, baseline = NULL, k, tau) {
  out <- list()
  if (!is.null(baseline)) {
    for (i in 1:tau) {
      out[[i]] <- c(baseline)
    }
  }

  if (length(out) == 0) {
    if (length(trt) == tau) {
      for (i in 1:tau) {
        if (i > 1) {
          out[[i]] <- c(time_vary[[i]], trt[i - 1])
        } else {
          out[[i]] <- c(time_vary[[i]])
        }
      }
    } else {
      for (i in 1:tau) {
        out[[i]] <- c(time_vary[[i]], trt)
      }
    }
  } else {
    if (length(trt) == tau) {
      for (i in 1:tau) {
        if (i > 1) {
          out[[i]] <- c(out[[i]], time_vary[[i]], trt[i - 1])
        } else {
          out[[i]] <- c(out[[i]], time_vary[[i]])
        }
      }
    } else {
      for (i in 1:tau) {
        out[[i]] <- c(out[[i]], time_vary[[i]], trt)
      }
    }
  }

  out <- slide_node_list(out, k)

  if (length(trt) == tau) {
    for (i in 1:tau) {
      out[[i]] <- c(out[[i]], trt[[i]])
    }
  }

  return(out)
}

outcome_node_list <- function(trt, time_vary, baseline = NULL, k, tau) {
  out <- list()
  if (length(trt) == tau) {
    for (i in 1:tau) {
      out[[i]] <- c(time_vary[[i]], trt[i])
    }
  } else {
    for (i in 1:tau) {
      out[[i]] <- c(time_vary[[i]], trt)
    }
  }

  out <- slide_node_list(out, k)

  if (!is.null(baseline)) {
    for (i in 1:tau) {
      out[[i]] <- c(baseline, out[[i]])
    }
  }
  return(out)
}

slide_node_list <- function(time_vary, k) {
  out <- paste(lapply(time_vary, function(x) paste(x, collapse = ",")))
  out <- slider::slide(out, ~ .x, .before = k)
  out <- lapply(out, function(x) {
    . <- strsplit(x, ",")
    if (k == 0) unlist(.)
    else unique(unlist(.))
  })
  return(out)
}

