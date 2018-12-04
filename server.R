library(data.table)
library(dplyr)
library(ggplot2)
library(shiny)

data <- data.table::fread("filtered_kill_match_Daniel.csv", header = TRUE, stringsAsFactors = FALSE)

weapon_plot <- function(map, player) {
  
  if(map == "MIRAMAR") {
    
    miramar <- filter(data, map == "MIRAMAR")
    
    if(player == "All players") {
      
      plotting(miramar, map, player)
      
    } else {
      
      miramar <- filter(miramar, killer_placement < 6)
      
      plotting(miramar, map, player)
      
    }
    
  } else {
    
    erangel <- filter(data, map == "ERANGEL")
    
    if(player == "All players") {
      
      plotting(erangel, map, player)
      
    } else {
      
      erangel <- filter(erangel, killer_placement < 6)
      
      plotting(erangel, map, player)
      
    }
    
  }
}

plotting <- function(data, map_of_choice, player_range) {
  
  weapon_summary <- group_by(data, killed_by) %>%
    summarize(number = n())
  
  ggplot(data = head(arrange(weapon_summary, -number), 10)) +
    geom_col(mapping = aes(x = killed_by, y = number, fill = killed_by)) +
    labs(title = paste("Weapon Popularity of", map_of_choice, "by", player_range),
         x = "Type of Weapon", fill = "Weapon type") +
    scale_y_continuous(name = "Number of kills (per weapon)",
                       labels = scales::comma) +
    geom_text(mapping = aes(x = killed_by, y = number, label = number),
              vjust = -0.5)
  
}

shinyServer(function(input, output) {
  
  output$weapon_plot <- renderPlot({
    weapon_plot(input$map, input$player)
  })
  
  
})