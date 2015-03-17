library(shiny)
library(rmarkdown)
library(car)

shinyUI(pageWithSidebar( 
  
  headerPanel =(h1("Modeling of PCR Tire Roll over Laser light")),
  
  sidebarPanel = (h3("Sheldon Chen")),
  
  #=====
  
  #=====
  mainPanel = (
    tabsetPanel(
      id = 'dataset',type = 'tabs',
      tabPanel('Data Table', dataTableOutput(outputId = 'table')),
      tabPanel('Plots', plotOutput(outputId = 'plot')),
      tabPanel('Artical',includeMarkdown(path = 'Artical.md')),
      tabPanel('Calculator',
               
               fluidRow(
                 column(3,
                   h5('Calculate Roll Over Laser light'),
                   numericInput(inputId = 'PA',label = 'PA',value = 700),
                   numericInput(inputId = 'PU',label = 'PU',value = 400),
                   textOutput(outputId = 'Result1')),
                 
                 column(3,
                    h5('Calculate PA Width'),
                    numericInput(inputId = 'RO',label = 'RollOver',value = 80),
                    numericInput(inputId = 'PU2',label = 'PU',value = 400),
                    textOutput(outputId = 'Result2'))
                 
               )
               ),
      tabPanel('Author')
      ))

    
    
    
    
    
    
    
    
    
    
    
    
    
    
)
  )