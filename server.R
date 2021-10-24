
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

shinyServer(function(input, output) {

  output$simPlot <- renderPlot({
    # generate vector of probabilities
    thisSet <- unlist(strsplit(input$elements, ","))
    x <- seq(1, input$size, 1)
    set.seed(input$seed)
    thisSample <- sapply(x, function(x){
      sum(sample(thisSet, x, replace = TRUE) == input$item)/x
    })
    plot(x, thisSample, type = "l", col = "steelblue", lwd = 1,
         xlab = "Sample size",
         ylab = paste0("Probability of ", input$item),
         main = "Simulation of probability as relative frequency",
         ylim = c(0,1))
    abline(h=1/length(thisSet), col = "red4", lwd = 2)
    text(input$size/2, 0.9, paste0("Last Probability: ", rev(thisSample)[1]))
  
  })
  

})
