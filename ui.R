
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

shinyUI(fluidPage(

  # Application title
  titlePanel("Relative frequency approach to Probability"),

  # Input text boxes
  sidebarLayout(
    sidebarPanel(
      textInput("elements", "Set elements (separated by commas)", value = "man,woman"),
      textInput("item", "Element to compute probability (one of the above)","woman"),
      numericInput("size", label = "Sample size from one to", 100),
      numericInput("seed", label = "Seed", 1)
    ),

    # Show a plot of the simulated samplings
    mainPanel(
      plotOutput("simPlot")
    )
  )
))
