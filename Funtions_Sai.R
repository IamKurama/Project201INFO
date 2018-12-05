find_circle_killers <- function(deaths,position.x , position.y){
  #create a circle around the position for getting a clear picture about where the person is 
  #assume a radius of 10 meters 
  killers_position <- filter(deaths,killer_position_x <= (position.x + 1000) ,killer_position_x >= (position.x - 1000) ,
    deaths$killer_position_y <= (position.y + 1000), deaths$killer_position_y >= (position.y - 1000))
  return(killers_position)
}


find_circle_victims <- function(deaths,position.x , position.y){
  #create a circle around the position for getting a clear picture about where the person is 
  #assume a radius of 10 meters 
  killers_position <- filter(deaths,victim_position_x <= position.x + 1000 , victim_position_x >= position.x - 1000 ,
    victim_position_y <= position.y + 1000,victim_position_y >= position.y - 1000)
  return(killers_position)
}

victims_plot <- function(deaths,position.x, position.y){
  #plot the enimes with red and victims with blue 
  data_enimies <- find_circle_killers(deaths,position.x , position.y)
  
  ggplot(data = data_enimies) +
    annotation_custom(g, xmin=-Inf, xmax=Inf, ymin=-Inf, ymax=Inf) +
    geom_point(mapping = aes(x = position.x,
                             y = position.y), size = 3, color = "white")+
    geom_point(mapping = aes(x = data_enimies$victim_position_x,
                             y = data_enimies$victim_position_y), size = 2, color = "green") +
    scale_x_continuous(name = "X Coordinate", labels = scales::comma, limits = c(0, 800000)) +
    scale_y_continuous(name = "Y Coordinate", labels = scales::comma, limits = c(0, 800000)) +
    labs(title = "Blue are Victims. You are white.Go win to get points " )
}

killer_plot  <- function(deaths,position.x, position.y){

data_vitims <- find_circle_victims(deaths,position.x , position.y)
ggplot(data = data_vitims) +
  annotation_custom(g, xmin=-Inf, xmax=Inf, ymin=-Inf, ymax=Inf) +
  geom_point(mapping = aes(x = position.x,
                           y = position.y), size = 3, color = "white")+
  geom_point(mapping = aes(x = data_vitims$killer_position_x,
                           y = data_vitims$killer_position_y), size = 2, color = "red") +
  scale_x_continuous(name = "X Coordinate", labels = scales::comma, limits = c(0, 800000)) +
  scale_y_continuous(name = "Y Coordinate", labels = scales::comma, limits = c(0, 800000)) +
  labs(title = "Red players are killers.You are white. Be carefull")
}
