library(shiny)
library(data.table)

death <- fread("~/Desktop/info201/a7-collaboration-pubg-fans/pubg-match-deaths/deaths/kill_match_stats_final_0.csv", stringsAsFactors = FALSE)
View(limit_data)
limit_data <- death[1:1000000]
ui <- basicPage(
  plotOutput("plot1", click = "plot_click"),
  verbatimTextOutput("info")
)

server <- function(input, output) {
  output$plot1 <- renderPlot({
    plot(limit_data$victim_position_x, limit_data$victim_position_y)
  })
  
  output$info <- renderText({
    paste0("x=", input$plot_click$x, "\ny=", input$plot_click$y)
  })
}

shinyApp(ui, server)
