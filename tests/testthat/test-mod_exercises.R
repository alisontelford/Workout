testServer(
  mod_exercises_server,
  # Add here your module params
  args = list(
    sv=list(
      list(
        arm_exercises=list(test1=c(1,2,3),
                           test2=c(4,5,6),
                           others=c(7,8,9)),
        leg_exercises=list(test1=c(1,2,3),
                           test2=c(4,5,6),
                           others=c(7,8,9)),
        core_exercises=list(test1=c(1,2,3),
                            test2=c(4,5,6),
                            others=c(7,8,9))
        )
      )
    )
  , {
    ns <- session$ns

    expect_true(
      inherits(ns, "function")
    )
    expect_true(
      grepl(id, ns(""))
    )
    expect_true(
      grepl("test", ns("test"))
    )
    # Here are some examples of tests you can
    # run on your module
    # - Testing the setting of inputs
    # session$setInputs(x = 1)
    # expect_true(input$x == 1)
    # - If ever your input updates a reactiveValues
    # - Note that this reactiveValues must be passed
    # - to the testServer function via args = list()
    # expect_true(r$x == 1)
    # - Testing output
    # expect_true(inherits(output$tbl$html, "html"))
})

test_that("module ui works", {
  ui <- mod_exercises_ui(id = "test")
  golem::expect_shinytaglist(ui)
  # Check that formals have not been removed
  fmls <- formals(mod_exercises_ui)
  for (i in c("id")){
    expect_true(i %in% names(fmls))
  }
})

