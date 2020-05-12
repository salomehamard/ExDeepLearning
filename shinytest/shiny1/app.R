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
  ),
  
  radioButtons(inputId = "idRadio", 
               label = "Choisi une heure !", 
               selected = 4,
               choices = c("8h" = "Wake up", "12h" = "Bon Appétit", "18h" = "ON EN A GROS !!!", "20h" = "On se fait un Sloubi ?")),
  textOutput("txt")
   
)

# Define server logic required to draw a histogram
server <- function(input, output) {
  output$txtaccueil <- renderText(
    paste("Bien le bonjour", input$name, "!")
  )
  output$txt <- renderText({
    paste (input$idRadio)
  })
 
}

shinyApp(ui=ui, server=server)