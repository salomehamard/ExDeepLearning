library(shiny)

### Partie User Interface

ui <- fluidPage (
  sidebarLayout(
    titlePanel(
      textOutput("L'application bizarre de Anne Laure GIRARD,
                 Salomé HAMARD et Dylan CLAIR")
    ),
    sidebarPanel(
      textInput("name", "Entrez votre nom ici :")
    ),
    
    mainPanel(
      textOutput("txtaccueil"))
  ))
