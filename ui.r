#ui.r

library(dplyr)
library(plotly)
library(shiny)

shinyUI(fluidPage(
    
    # Application title
    titlePanel("Iris Information"), 
    
    # 
    sidebarLayout(
      # Create a sidebarPanel of the app
      sidebarPanel(
        # Create a slider that has 2 slide buttons to make a range so the user can 
        # select the values they would like to see on the bar plot
        sliderInput("slider", label = h3("Petal Length Range"), min = 0, max = 7, 
                    value = c(2, 5), step = 0.1),
        # Create radio buttons so the user can select whether they would like to see
        # a scatter plot with information about iris' sepals or petals
        radioButtons("radio", label = h3("Petal or Sepal"),
                     choices = list("Petal" = 1, "Sepal" = 2), 
                     selected = 1)
      ),
      
      # Create a mainPanel of the app
      mainPanel(
        # Plot the output with the name "histogram"
        plotOutput('bargraph'),
        # Plot the output with the name "scatterplot"
        plotlyOutput('scatterplot')
      )
    )
  )
)

