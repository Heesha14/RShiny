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
                  
                  #textOutput indicates our output variabe will be a text
                  mainPanel(textOutput("selected_var"))
                ))



# Define server logic ----
server <- function(input, output) {
  
  
  # output$selected_var <- renderText({ 
  #  "You have selected this"
  # })
  
  # build the object
  # Ui object is text then renderText
  output$selected_var <- renderText({ 
    paste("You have selected this",input$var)
  })
  
}


# Run the app ----
shinyApp(ui = ui, server = server)