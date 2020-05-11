### Partie serveur

server <- function(input, output, session) {
  output$txtaccueil <- renderText({
    paste("Bien le bonjour", input$name,".")
  })
  
}

shinyApp(ui, server)