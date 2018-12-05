library(data.table)
library(dplyr)
library(ggplot2)
library(gridExtra)
library(grid)
library(jpeg)
library(shiny)


#process and gather the data
data <- data.table::fread("data/filtered_kill_match_Daniel.csv", header = TRUE, stringsAsFactors = FALSE)

weapon_stat <- read.csv("data/PUBG Weapon Stats.csv", stringsAsFactors = FALSE)
weapon_stat <- select(weapon_stat, X, Weapon, Ammo, Fire.Rate, Damage, Bullet.Speed, Reload, Range)

victim_position <- data.table::fread("data/victim_position_Daniel.csv", header = TRUE, stringsAsFactors = FALSE)
victim_position$time <- round(victim_position$time)

map_image <- readJPEG("ERANGEL.jpg", native = TRUE)
g <- rasterGrob(map_image, width= unit(1,"npc"), height = unit(1,"npc") ,interpolate=FALSE)


deaths <- fread("data/sai_deaths.csv")

source('Funtions_Daniel.R')
source('Funtions_Sai.R')

shinyServer(function(input, output, session) {
  
  output$weapon_plot <- renderPlot({
    weapon_plot(input$map, input$player)
    
  })
  
  output$weapon_plot_stats <- renderPlot({
    grid.table(top_10_weapon_data)
  })
  
  output$death_plot <- renderPlot({
    death_plot(input$time_passed)
  })
  
  output$victim_killer_plot <- renderPlot({
    if(input$kvmap == "Victims"){
      victims_plot(deaths, input$Xcordinate,input$Ycordinate)
    }
    else{
      killer_plot(deaths, input$Xcordinate,input$Ycordinate)
    }
  })
  
})