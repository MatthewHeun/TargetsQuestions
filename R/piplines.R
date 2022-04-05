#' Create a pipeline programmatically
#'
#' @param which_countries The countries of interest for this pipeline
#'
#' @return A `targets` pipeline.
#'
#' @export
get_pipeline <- function(which_countries) {
  countries <- NULL # avoid R CMD CHECK warning
  print(which_countries) # Shows that which_countries is available
  list(
    targets::tar_target(
      name = countries,
      command = which_countries # But here, which_countries is not found
    )
  )
}
