setwd("/Users/jessicalibman/Desktop/Info 498/a8-building-applications")
# install.packages("dplyr")
# install.packages("plotly")
# install.packages("shiny")
library(dplyr)
library(plotly)
library(shiny)

data <- iris

### Use input to create a string    
shinyServer(
  function(input, output) {
    output$min <- renderText("slider")
    # You can access the value of the widget with input$slider1, e.g.
    output$bargraph <- renderPlot({
      x <- data %>% select(Petal.Length,Species) %>% 
                    slice(input$min : input$max) 
      num_of_species <- x %>% group_by(Species) %>% 
                              summarise(num_species = n())
      #bins <- number_of_species
        
      
      
      
      return (barplot(num_of_species$num_species, names = num_of_species$Species, main = "Petal and Species Information", xlab = "Species", ylab = "Frequency of Species"))
    })
    
    
    output$scatterplot <- renderPlot({ input$radio })
  }
)



  