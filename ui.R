library(shiny)

shinyUI(navbarPage(
  
  theme = 'styles.css',
  
  "PUBG Project",
  
  tabPanel("Home",
         tags$div(
           p("Video games are a rich area for data extraction due to its digital nature. 
              Notable examples such as the League of legends, World of Warcraft and even
              Grand Theft Auto. Data scientists can gain insight on the logic and decision-making
              that the players face when put in virtual scenarios. 

              For the last two years, two games are dominating twitch and other gaming networks: 
              Fortnite and PUBG. PlayerUnknown's Battlegrounds was the most watched battle-royale 
              game on Twitch before Fortnite exploded in popularity, and it's widely considered 
              the more mature alternative.")
         )
  ),      
  
  tabPanel("Weapon Popularity of PUBG",
      tags$div(
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
          shooting. After M416, the top 5 weapons are always occupied by SCAR-L, AKM, and M16A4,
          which shows that assault rifle is really popular among players of PUBG."),
  
       verticalLayout(
    
         mainPanel(
    
           plotOutput("weapon_plot_stats")
    
         ),
  
         p("The above table is a summary of data about those top 10 weapons. It's provided by
           PUBG's official website. All columns related to time and distance use second and meter 
           as their unit. For example, Fire.Rate column means the amount of bullet a weapon can 
           fire per second. Also, the damage is based on hp of player which is 100 in this game.")
  
        )
      )
  ),
  tabPanel("The progression of game",
           tags$div(
             p("Map of choice."),
             
             sidebarLayout(
               
               sidebarPanel(
                 
                 ##selectInput(inputId = "map_death",
                   ##          label = "Map",
                     ##        choices = unique(data$map)),
                 
                 sliderInput(inputId = "time_passed",
                             label = "Number of minutes passed",
                             min = 0, max = 40, value = 0)
                 
               ),
               
               mainPanel(
                 
                 plotOutput("death_plot")
                 
               )
               
             )
             
             )
  )
    
))
