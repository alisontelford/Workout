#' The application User-Interface
#'
#' @param request Internal parameter for `{shiny}`.
#'     DO NOT REMOVE.
#' @import shiny
#' @import shinydashboard
#' @import shinyWidgets
#' @noRd
app_ui <- function(request) {
  # Logo at top-right
  title_content <- {
    tags$div(
      tags$img(
        src = "www/favicon.png", "",
        height = "50px", style = "vertical-align: middle;"
      )
    )
  }
  # Main text on home page
  title_text_main_cond <- {
    tags$div(
      h2("Welcome to Alison's Workout playlist!")
    )
  }

  # Secondary text on home page
  title_text_secondary_cond <- {
    tags$div(
      h4("This application will randomly select your workout playlist depending on your area of focus.")
    )
  }
  tagList(
    # Leave this function for adding external resources
    golem_add_external_resources(),
    # Your application UI logic
    dashboardPage(
      # Set up the dashboard header.
      dashboardHeader(
        title=title_content
      ),
      # Set up the dashboard sidebar.
      dashboardSidebar(
        sidebarMenu(
          id="sidebarID",
          menuItem("Home", tabName="home", icon=icon("home")),
          menuItem("Exercises", tabName="exercises", icon=icon("dumbbell"))
        )
      ),
      dashboardBody(
        tabItems(
          tabItem(
            tabName="home",
            tags$div(
              style = "vertical-align: middle; text-align: center;",
              tags$img(src="www/favicon.png", height="200px")
            ),
            title_text_main_cond,
            title_text_secondary_cond,
            div(style = "height: 30px"),
            div(
              shinydashboard::box(
                title = "Application Notes",
                solidHeader = FALSE,
                collapsible = TRUE,
                collapsed = FALSE,
                width = 12,
                background = NULL,
                HTML("
                <h4><strong>0.5.0 (18/12/2024)</strong></h4>
                  <ul>
                      <li>First deployed version.</li>
                  </ul>
                     ")
              )
            )
          ),
          tabItem(
            tabName="exercises",
            mod_exercises_ui("exercises_1")
          )
        )
      )
    )
  )
}

#' Add external Resources to the Application
#'
#' This function is internally used to add external
#' resources inside the Shiny application.
#'
#' @import shiny
#' @importFrom golem add_resource_path activate_js favicon bundle_resources
#' @noRd
golem_add_external_resources <- function() {
  add_resource_path(
    "www",
    app_sys("app/www")
  )

  tags$head(
    favicon(ext='png'),
    bundle_resources(
      path = app_sys("app/www"),
      app_title = "Workout"
    )
    # Add here other external resources
    # for example, you can add shinyalert::useShinyalert()
  )
}
