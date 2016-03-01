library(dplyr)
library(plotly)
library(shiny)

shinyUI(fluidPage(
    
    # Application title
    titlePanel("Iris Information"), 
    
    sidebarLayout(
      
      sidebarPanel(
        sliderInput("slider", label = h3("Petal Length Range"), min = 0, max = 7, 
                    value = c(2, 5), step = 0.1),
        #textOutput("min", slider$min),
        #textOutput("max", slider$max)
        
        
        
        
        
        radioButtons("radio", label = h3("Petal or Sepal"),
                     choices = list("Petal" = 1, "Sepal" = 2), 
                     selected = 1)
        
        
        
        
      ),
      
      # Create a mainPanel of the app
      mainPanel(
        # Plot the output with the name "histogram"
        plotOutput("bargraph"),
        
        plotOutput("scatterplot")
        
        
        
        
      )
      #fluidRow(verbatimTextOutput("slider")
      )
    )
  )

