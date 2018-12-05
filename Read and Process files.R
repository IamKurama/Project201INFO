agg <- fread("agg_match_stats_0.csv")
agg <- agg[party_size == 1]
agg <- agg[1:1000000]

deaths <- fread("kill_match_stats_final_0.csv")
deaths <- select(deaths, killer_position_x, killer_position_y,victim_position_x, victim_position_y ,map)
deaths <- deaths[map == "ERANGEL"]
deaths <- deaths[1:1000000]