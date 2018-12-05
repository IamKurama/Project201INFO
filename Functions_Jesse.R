library(dplyr)
library(stringr)
library(ggplot2)


# given agrregate data, 'agg_match_stats_0.csv',
# when given 'View Mode', plots out the frequencies of the mode used
# by players who landed in a rank of 1
# when given 'Player Kills' plots out the frequencies of total kills
# made by players who landed in a rank of 1
placement_data <- function(data, data_type) {
  top_placement <- filter(data, team_placement <= 1)
  if (data_type == 'View Mode') {
    mode <- select(top_placement, match_mode)
    if (!('fpp' %in% mode$match_mode)) {
      match_mode <- c("fpp")
      fpp <- data.frame(match_mode, stringsAsFactors = FALSE)
      mode <- rbind(mode, fpp)
    }
    shapes <- table(mode)
    # plotting data
    mode_plot <- barplot(shapes, xlab = "Game Mode", ylab = "Mode frequency", 
                         main = "Top Placement Game Mode", las = 2, cex.names = 0.7, col = topo.colors(2))
    return(mode_plot)
  } else {
    mode <- select(top_placement, player_kills)
    shapes <- table(mode)
    # plotting data
    mode_plot <- barplot(shapes, xlab = "Total kills", ylab = "amount of players", 
                         main = "Top Placement Total Kills", las = 2, cex.names = 0.7, col = topo.colors(9))
    return(mode_plot)
  }
}

