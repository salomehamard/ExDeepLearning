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
  textOutput("txt"),
 
  selectInput(inputId = "idsloubi",
              label = "Choisis un sloubi",
              selected = NULL,
              choices = c("Slouby 1" = "Chante sloubi",
                          "Sloubi 2" = "rakatak-mik", "Sloubi 3" = "kayak-kata",
                          "Sloubi 4" = "joue ganoue", "Sloubi 5" = "jeu boulin",
                          "Sloubi 6" = "jeu carré", "Sloubi 7" = "doublette")),
  textOutput("txtsloubi"),  
  titlePanel("Image output"),
  
  fluidRow(
    column(4, wellPanel(
      radioButtons("picture", "Picture:",
                   c("Un peu de latin", "C'est pas faut"))
    )),
    column(4,
           imageOutput("image2")
    )
  )
  )

# Define server logic required to draw a histogram
server <- function(input, output) {
  output$txtaccueil <- renderText(
    paste("Bien le bonjour", input$name, "!")
  )
  output$txt <- renderText({
    paste (input$idRadio)
  })
  output$txtsloubi <- renderText({
    paste (input$idsloubi)
})
  output$image2 <- renderImage({
    if (is.null(input$picture))
      return(NULL)
    
    if (input$picture == "C'est pas faut") {
      return(list(
        src = "0c6c319447cea2759446e6f2266a69af.png",
        contentType = "image/png",
        alt = "C'est pas faut"
      ))
    } else if (input$picture == "Un peu de latin") {
      return(list(
        src = "missa.png",
        filetype = "image/png",
        alt = "Un peu de latin"
      ))
    }
    
  }, deleteFile = FALSE)
  
}

shinyApp(ui=ui, server=server)