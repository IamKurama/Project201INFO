#To preprosses the data 
# deaths is the data i am passing that is the deaths 
deaths

#the position is in centimeters
find_circle_killers <- function(position.x , position.y){
  #create a circle around the position for getting a clear picture about where the person is 
  #assume a radius of 10 meters 
  killers_position <- filter(deaths, killer_position_x - 10 > position.x ,
                                     killer_position_x + 10 < position.x ,
                                     killer_position_y - 10 > position.y ,
                                     killer_position_y + 10 < position.y )
  return(killers_position)
}


find_circle_victims <- function(position.x , position.y){
  #create a circle around the position for getting a clear picture about where the person is 
  #assume a radius of 10 meters 
  killers_position <- filter(deaths, victim_position_x - 10 > position.x ,
                             victim_position_x + 10 < position.x ,
                             victim_position_y - 10 > position.y ,
                             victim_position_y + 10 < position.y )
  return(killers_position)
}




