# load packages
library(shiny)
library(ggplot2)

# Define UI
ui <- fluidPage(
  titlePanel("Baby Name Explorer"),
  sidebarLayout(
    sidebarPanel(textInput('name', 'Enter Name', 'David')),
    mainPanel(plotOutput('trend'))
  )
)

# Define server
server <- function(input, output, session) {
  output$trend <- renderPlot({
    # CODE BELOW: Update to display a line plot of the input name
    ggplot(subset(babynames, name == input$name)) + 
      geom_line(aes(x = year, y = prop, color = sex))
  })
}

# Render app
shinyApp(ui = ui, server = server)