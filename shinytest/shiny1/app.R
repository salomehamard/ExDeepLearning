library(shiny)

# Define UI for application that draws a histogram
ui <- fluidPage(
  # Application title
  titlePanel(
    textOutput("L'application bizarre de Anne-Laure GIRARD,
               Salomé HAMARD et Dylan CLAIR")
  ),
  sidebarLayout(
    
    sidebarPanel(
      textInput("name", "Entrez votre nom ici :")
    ),
    
    mainPanel(
      textOutput("txtaccueil"))
  )
   
)

# Define server logic required to draw a histogram
server <- function(input, output) {
  output$txtaccueil <- renderText(
    paste("bien le bonjour", input$name, "!")
  )
 
}

shinyApp(ui=ui, server=server)