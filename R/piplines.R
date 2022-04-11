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
      # command = Countries                              # Object Countries not found
      # command = c(Countries, Countries)                # Object Countries not found
      # command = c(quote(Countries), quote(Countries))  # Not length 1.
      # command = rlang::enexpr(c(Countries, Countries)) # `arg` must be a symbol
      command = quote(combine_countries(Countries))
    )
  )
}


#' Make a copy of couns
#'
#' @param couns The incoming country list
#'
#' @return `c(couns, couns)`
#'
#' @export
combine_countries <- function(couns) {
  c(couns, couns)
}
