#' The application server-side
#'
#' @param input,output,session Internal parameters for {shiny}.
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_server <- function(input, output, session) {
  ### Static values -------------------
  sv <- list(
    arm_exercises=arm_exercises,
    leg_exercises=leg_exercises,
    core_exercises=core_exercises
    )

  ### Reactive values -------------------
  rv <-
    reactiveValues(

    )

  ### Exercises Tab
  mod_exercises_server("exercises_1", sv)
}
