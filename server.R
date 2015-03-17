library(shiny)
library(rmarkdown)
library(car)

df <- read.csv(file = "data/DATA.csv",header = TRUE)

shinyServer(function(input, output){
 
    #======================
    output$table <- renderDataTable(
      df,options = list(pageLength = 15)
    )
    
    #====================
    output$plot <- renderPlot({
      lm.sol <- lm(data = df,formula = log(FINAL)~PA+PU)
      opar <- par(mfrow=c(1,4))
      plot(lm.sol,1:4)
#       qqPlot(lm.sol)
#       crPlots(lm.sol)
      par(opar)
    })
  
    #====
    output$Result1 <- renderText({
      a <- round(exp(3.2819822-0.0052771 *input$PA+0.0113477*input$PU),1)
      paste('RollOver light is',a)
    })
  
    #====
    output$Result2 <- renderText({
      b <- round((3.2819822+0.0113477*input$PU2-log(input$RO))/0.0052771,0)
      paste('PA adjust to',b)
    })
  
  
  
  
})