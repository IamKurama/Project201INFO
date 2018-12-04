library(shiny)

shinyUI(fluidPage(
  
  titlePanel("Weapon Popularity of PUBG"),
            p("This analysis of weapon popularity is based on the death data of players
              from PUBG. As a sample data, it contains information of more than 100000 matches. 
              The following bar chart will display kills made by top 10 weapons in Erangel and Miramar,
              two maps of PUBG."),
            
        h1("Top 10 weapons of PUBG"),
  
  sidebarLayout(
    
    sidebarPanel(
      
      selectInput(inputId = "map",
                  label = "Map",
                  choices = unique(data$map)),
      
      selectInput(inputId = "player",
                  label = "Player",
                  choices = c("All players", "Top 5 players"))
      
    ),
    
    mainPanel(
      
      plotOutput("weapon_plot")
      
    )
  ),
  p("Based on the result of chart, we can see that in both maps the most popular weapon is
     always M416, a balanced and flexible assault rifle that works well for medium-range 
     shooting. After M416, the top 5 weapons are always occupied SCAR-L, AKM, and M16A4,
     which shows that assault rifle is really popular among players of PUBG.")
 )
)
