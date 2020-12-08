# lmtp 1.0.0.9000

### New Features

-   For time-to-event analysis, survival probability is now estimated instead of the cumulative incidence. This fixes a bug with IPW and survival problems.

-   Outcome type now accepts `"survival"` for explicit indication of a survival outcome (issue \#76). Because of this `lmtp_ipw()` now requires setting the outcome type.

-   New `.trimming` parameter for trimming extreme density ratios.

-   New `.SL_folds` parameter that controls the splits used for fitting the SuperLearner (issue \#84).

-   New `.return_all_ratios` parameter that allows for returning non-cumulative product density ratios to the user.

-   `bound` parameter renamed to `.bound`.

### Bug Fixes

-   Fixed a bug that outputted outcome regressions and density ratios in incorrect order compared to the original data.

-   Fixed a bug in the missing data check that threw an error for missing data after an observation experiences the outcome.

-   Fixed a bug in the calculation of standard errors when the `id` parameter is specified.

-   Fixed a bug that resulted in `NA` censoring indicators throwing an error for missing data.

-   Fixed a bug about `values()` being deprecated in the **future** package (issue \#82).

-   Fixed a warning from the **future** package regarding random number generation (issue \#81).

-   Fixed `create_node_list()` returns description (issue \#77).

### Dependencies

-   Now relies on the **SuperLearner** package for estimation.

-   **slider** dependency removed.

-   **data.table** added as a dependency.

### General

-   `event_locf()` speed greatly improved (issue \#80).

-   Migrated continuous integration from Travis-CI to GitHub Actions.

-   Added a `NEWS.md` file to track changes to the package.

-   License change to GPL-3.
