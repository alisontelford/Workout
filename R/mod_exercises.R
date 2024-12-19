#' exercises UI Function
#'
#' @description A shiny Module.
#'
#' @param id the module ID
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_exercises_ui <- function(id) {
  tagList(
    fluidRow(
      align="center",
      tags$div(h2("Please select a day to begin:")),
      div(style = "height: 100px")
    ),
    fluidRow(
      column(
        width=4, align="center",
        div(
          style = "display: flex; align-items: center; text-align: center; justify-content: center;",
          shinyWidgets::actionBttn(
            inputId = NS(id, "arm"),
            label = "Arm Day",
            style = "gradient",
            color = "primary",
            icon = icon("hammer"),
            size="lg"
          )
        )
      ),
      column(
        width=4, align="center",
        div(
          style = "display: flex; align-items: center; text-align: center; justify-content: center;",
          shinyWidgets::actionBttn(
            inputId = NS(id, "leg"),
            label = "Leg Day",
            style = "gradient",
            color = "primary",
            icon = icon("stairs"),
            size="lg"
          )
        )
      ),
      column(
        width=4, align="center",
        div(
          style = "display: flex; align-items: center; text-align: center; justify-content: center;",
          shinyWidgets::actionBttn(
            inputId = NS(id, "core"),
            label = "Core Day",
            style = "gradient",
            color = "primary",
            icon = icon("bug"),
            size="lg"
          )
        )
      ),
      div(style = "height: 200px")
    ),
    fluidRow(
      column(
        width=12, align="center",
        div(
          style = "display: flex; align-items: center; text-align: center; justify-content: center; gap: 75px",
          shinydashboard::box(
            title = "Exercise 1",
            solidHeader = FALSE,
            collapsible = FALSE,
            collapsed = FALSE,
            width = NULL,
            background = NULL,
            textOutput(NS(id, "exercise1"))
          ),
          shinydashboard::box(
            title = "Exercise 2",
            solidHeader = FALSE,
            collapsible = FALSE,
            collapsed = FALSE,
            width = NULL,
            background = NULL,
            textOutput(NS(id, "exercise2"))
          ),
          shinydashboard::box(
            title = "Exercise 3",
            solidHeader = FALSE,
            collapsible = FALSE,
            collapsed = FALSE,
            width = NULL,
            background = NULL,
            textOutput(NS(id, "exercise3"))
          ),
          shinydashboard::box(
            title = "Exercise 4",
            solidHeader = FALSE,
            collapsible = FALSE,
            collapsed = FALSE,
            width = NULL,
            background = NULL,
            textOutput(NS(id, "exercise4"))
          ),
          shinydashboard::box(
            title = "Exercise 5",
            solidHeader = FALSE,
            collapsible = FALSE,
            collapsed = FALSE,
            width = NULL,
            background = NULL,
            textOutput(NS(id, "exercise5"))
          )
        )
      )
    )
  )
}

#' exercises Server Functions
#' @param id the module ID
#' @param sv the static variables
#' @noRd
mod_exercises_server <- function(id, sv){
  moduleServer(id, function(input, output, session){
    # Import Objects
    ns <- session$ns
    arm_exercises=sv$arm_exercises
    leg_exercises=sv$leg_exercises
    core_exercises=sv$core_exercises
    # Observe event for when `Arm Day` is pressed
    observeEvent(input$arm, {
      exercises=Workout::sample_exercise(arm_exercises)
      sapply(c(1:5), function(x){output[[paste0("exercise",x)]]=renderText(exercises[x])})
    })
    # Observe event for when `Leg Day` is pressed
    observeEvent(input$leg, {
      exercises=Workout::sample_exercise(leg_exercises)
      sapply(c(1:5), function(x){output[[paste0("exercise",x)]]=renderText(exercises[x])})
    })
    # Observe event for when `Core Day` is pressed
    observeEvent(input$core, {
      exercises=Workout::sample_exercise(core_exercises)
      sapply(c(1:5), function(x){output[[paste0("exercise",x)]]=renderText(exercises[x])})
    })
  })
}

## To be copied in the UI
# mod_exercises_ui("exercises_1")

## To be copied in the server
# mod_exercises_server("exercises_1")
