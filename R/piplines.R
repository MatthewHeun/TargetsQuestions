#' Creates a pipeline programmatically
#'
#' @param which_countries The countries of interest for this pipeline
#'
#' @return A `targets` pipeline.
#'
#' @export
get_pipeline <- function(which_countries) {
  print(which_countries)
  list(
    targets::tar_target(
      name = countries,
      command = which_countries
    )
  )
}
