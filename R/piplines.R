#' Create a pipeline programmatically
#'
#' @param which_countries The countries of interest for this pipeline
#'
#' @return A `targets` pipeline.
#'
#' @export
get_pipeline <- function(which_countries) {
  list(
    targets::tar_target_raw(
      name = "Countries",
      # command = which_countries # which_countries must have length 1
      # command = !!which_countries # invalid argument type
      command = rlang::enexpr(which_countries) # Works
    ),

    targets::tar_target_raw(
      name = "DoubleCountries",
      command = c(Countries, Countries)
    )
  )
}
