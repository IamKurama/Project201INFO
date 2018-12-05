library(ggplot2)
library(ggpubr)
library(dplyr)


death <- fread("~/Desktop/info201/a7-collaboration-pubg-fans/pubg-match-deaths/deaths/kill_match_stats_final_0.csv", stringsAsFactors = FALSE)
limit_data <- death[1:1000000]

function2 <- function(dataset) {
  summary <- dataset %>%
    group_by(time) %>%
    summarise(counts = n())
  ggplot(summary) +
    aes(x = time, y = counts) +
    labs(title = "Survival Rate of PUBG Gamers in Second in matches") +
    geom_line() 
}

function2(limit_data)

# This graph shows the survival rate of the victims in matches throughout time in second. 
# As shown in the graph most people dies at around 125 seconds and death decreases as time 
# progress.