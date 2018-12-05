#To preprosses the data 
# deaths is the data i am passing that is the deaths 
library(data.table)
library(dplyr)

deaths <- fread("data/sai_deaths.csv")


find_circle_killers <- function(position.x , position.y){
  #create a circle around the position for getting a clear picture about where the person is 
  #assume a radius of 10 meters 
  killers_position <- deaths[killer_position_x <= position.x + 1000 ][killer_position_x >= position.x - 1000 ][
    killer_position_y <= position.y + 1000][killer_position_y >= position.y - 1000
  ]
  return(killers_position)
}


find_circle_victims <- function(position.x , position.y){
  #create a circle around the position for getting a clear picture about where the person is 
  #assume a radius of 10 meters 
  killers_position <- deaths[victim_position_x <= position.x + 1000 ][victim_position_x >= position.x - 1000 ][
    victim_position_y <= position.y + 1000][victim_position_y >= position.y - 1000]
  return(killers_position)
}




