weapon_plot <- function(map, player) {
  if(map == "MIRAMAR") {
    miramar <- data[map == "MIRAMAR"]
    if(player == "All players") {
      plotting(miramar, map, player)
      
    } 
    else {
      miramar <- miramar[killer_placement < 6]
      plotting(miramar, map, player)
    }
  } 
  else {
    erangel <- filter(data, map == "ERANGEL")
    if(player == "All players") {
      plotting(erangel, map, player)
    } 
    else {
      erangel <- erangel[killer_placement < 6]
      plotting(erangel, map, player)
    }
  }
}


plotting <- function(data, map_of_choice, player_range) {
  weapon_summary <- group_by(data, killed_by) %>%
    summarize(number = n())
  
  top_10_weapon <- head(arrange(weapon_summary, -number), 10)
  weapon_stat <- weapon_stat[match(top_10_weapon$killed_by, weapon_stat$Weapon), ]
  weapon_stat <- filter(weapon_stat, Weapon != "NA")
  assign("top_10_weapon_data", weapon_stat, envir = globalenv())
  
  return(ggplot(data = top_10_weapon) +
           geom_col(mapping = aes(x = killed_by, y = number, fill = killed_by)) +
           labs(title = paste("Weapon Popularity of", map_of_choice, "by", player_range),
                x = "Type of Weapon", fill = "Weapon type") +
           scale_y_continuous(name = "Number of use (per weapon)",
                              labels = scales::comma) +
           geom_text(mapping = aes(x = killed_by, y = number, label = number),
                     vjust = -0.5))
  
}


death_plot <- function(minute) {
  victim_position <- victim_position[round(victim_position$time) == (minute * 60),]
  ggplot(data = victim_position) +
    annotation_custom(g, xmin=-Inf, xmax=Inf, ymin=-Inf, ymax=Inf) +
    geom_point(mapping = aes(x = victim_position$victim_position_x,
                             y = victim_position$victim_position_y), size = 1, color = "red") +
    labs(title = paste("Death Position"), x = "X coordinate", y = "Y coordinate")
  
}
