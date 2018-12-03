#To preprosses the data 
# deaths is the data i am passing that is the deaths 
library(data.table)
library(dplyr)

deaths <- fread("kill_match_stats_final_0.csv")
deaths <- select(deaths, killer_position_x, killer_position_y,victim_position_x, victim_position_y ,map)
deaths <- deaths[map == "ERANGEL"]
deaths <- deaths[1:1000000]
#the position is in centimeters
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
    victim_position_y <= position.y + 1000][victim_position_y >= position.y - 1000
                                            ]
  return(killers_position)
}




