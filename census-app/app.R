# setwd("D:/SLIIT/Y4.S1/Y4.S1/Visual Analytics and User Experience Design/Lab/Lab8")
#
# install.packages(c("maps","mapproj"))
#
# # Load packages ----
# library(shiny)
# library(quantmod)
# library(maps)
# library(mapproj)
#
# counties <- readRDS("census-app/data/counties.rds")
# head(counties)
#
# source("census-app/helpers.R")
# counties <- readRDS("census-app/data/counties.rds")
# percent_map(counties$white, "darkgreen", "% White")


# User interface ----
ui <- fluidPage(titlePanel("censusVis"),
                
                sidebarLayout(
                  sidebarPanel(
                    helpText("Create demographic maps with
        information from the 2010 US Census."),
                    
                    selectInput(
                      "var",
                      label = "Choose a variable to display",
                      choices = c(
                        "Percent White",
                        "Percent Black",
                        "Percent Hispanic",
                        "Percent Asian"
                      ),
                      selected = "Percent White"
                    ),
                    
                    sliderInput(
                      "range",
                      label = "Range of interest:",
                      min = 0,
                      max = 100,
                      value = c(0, 100)
                    )
                  ),
                  
                  mainPanel(plotOutput("map"))
                ))

# Server logic ----
server <- function(input, output) {
  output$map <- renderPlot({
    data <- switch(
      input$var,
      "Percent White" = counties$white,
      "Percent Black" = counties$black,
      "Percent Hispanic" = counties$hispanic,
      "Percent Asian" = counties$asian
    )
    
    percent_map(
      var = data,
      color = "darkgreen",
      legend.title = "Countries ",
      max = 0,
      min = 100
    )
  })
}


# Run app ----
shinyApp(ui, server)
