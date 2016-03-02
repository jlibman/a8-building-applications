# server.r

setwd("/Users/jessicalibman/Desktop/Info 498/a8-building-applications")
# install.packages("dplyr")
# install.packages("plot_ly")
# install.packages("shiny")
library(dplyr)
library(plotly)
library(shiny)

# Load data
data <- iris

# Code to be executed by the shiny server
shinyServer(function(input, output) {
  
  # Make a bar graph that adapts to user input
  output$bargraph <- renderPlot({
    # Select only relevent data from the dataframe incorporating the user input 
    # from the sliders
    x <- data %>% select(Petal.Length, Species) %>% 
      filter(Petal.Length > input$slider[1] & Petal.Length < input$slider[2])
    # Finds number of bars to plot
      num_of_species <- x %>% group_by(Species) %>% 
      summarise(num_species = n())
    # Return a bar plot that represents the number of iris' in each species that  
    # has a petal length in the selected range.
    return (barplot(num_of_species$num_species, names = num_of_species$Species, 
              main = "Length and Frequency of Species Information",
               xlab = "Species", ylab = "Frequency of Species"))
  })
  
  # Make a scatter plot that adapts to user input
  output$scatterplot <- renderPlotly({ 
    # Create variables to represent relevent data specific to petals or sepals
    petal <- data %>% select(Petal.Length, Petal.Width)
    sepal <- data %>% select(Sepal.Length, Sepal.Width)
    # Takes user input from radio buttons and outputs the correct scatter plot
    if(input$radio == 1){
      plot_ly(data = petal, x = Petal.Length, y = Petal.Width, mode = "markers") %>% 
                layout(title = "Petal Width verse Length",
                    scene = list(
                        xaxis = list(title = "Length"), 
                        yaxis = list(title = "Width")))
    } else {
      plot_ly(data = sepal, x = Sepal.Length, y = Sepal.Width, mode = "markers") %>% 
               layout(title = "Sepal Width verse Length",
                   scene = list(
                        xaxis = list(title = "Length"), 
                        yaxis = list(title = "Width")))
    }
  })
})



  