library(shiny)

shinyUI(navbarPage(
  
  theme = 'styles.css',
  
  "PUBG Project",
  
  tabPanel("Home",
         tags$div(
           
           p("Video games are a rich area for data extraction due to its digital nature.
              Notable examples such as the League of legends, World of Warcraft and even
              Grand Theft Auto. Data scientists can gain insight on the logic and decision-making
              that the players face when put in virtual scenarios."),

            p("For the last two years, two games are dominating twitch and other gaming networks: 
              Fortnite and PUBG. PlayerUnknown's Battlegrounds was the most watched battle-royale 
              game on Twitch before Fortnite exploded in popularity, and it's widely considered 
              the more mature alternative."),
           img(src = "https://www.extremetech.com/wp-content/uploads/2017/12/PUBG-Feature-640x353.jpg", align = "center"),
           
           h1("PlayerUnknown's BattleGrounds(PUBG)"),
           
           p("PUBG is a first/third-person shooter battle royale style game that matches over 100 players
             on a large island where teams and players fight to the death until one or one team remains."),
           
           p("Each match starts with players parachuting from a plane onto a map area approximately 
              8 × 8 kilometres (5.0 × 5.0 mi) in size. The plane's flight path across the map varies 
              with each round, requiring players to quickly determine the best time to eject and 
              parachute to the ground. Players start with no gear beyond customized clothing selections 
              which do not affect gameplay. After landing they have to scavenge towns, barns and buildings
              for weapons, ammo, armor and first-aid.Players will then decide to either fight or hide or 
              just move with the ultimate goal of being the last one standing. The winner of the game get 
              a Winner Winner Chicken Dinner."),
           p("A bluezone will appear a few minutes into the game to force players closer and closer
              together by dealing damage to anyone that stands within the bluezone and sparing whoever 
              is within the safe zone."),
           img(src = "https://i.redd.it/djzln9jnhrez.jpg", height = 800 , width = 1000),
           h3("The Maps"),
           p(" Here are short descriptions about each map:"),
           p("Erangel is a fictional island in the black sea abandoned near Russia where a military occupation was controlling it. "),
           img(src = "Erangel_pic.jpeg",height = 400 , width = 1000),
           p("Miramar offers unique terrain and dense urban areas. With an island to the south east home to a prison and smaller villages, the entire area is cut off from the west and north-east by enormous canyons and mountains, with a looming metal wall to the north keeping outsiders out, and players in."),
           img(src = "Miramir_pic.jpeg",height = 400 , width = 1000),
           h2("Who is our target audience? "),
           p("Our target audience are people who play PUBG as they might be interested in 
             learning ways to become better at playing this game. But our audience could also 
             be the makers of the game, because they might need this dataset to know how to 
             improve the game and also eliminate any software bugs (if there’s any)."),
           h2("What we wanted to understand about our data ?"),
           p("Our target audience may be interested in the strategy that can help players to survive and 
            gain victory in matches. Through data visualization, this dataset will be able to 
            show them some hints for game such as locations where conflicts between players happen 
            frequently, balance between killing and survival rate and better starting points.
            Those information will help players to develop their own ways of surviving.")
         )
  ),      
  tabPanel("Our Team",
           tags$div(
             h1("Our Team"),
             h2("Sai Sur"),
             p("Hometown : Doha, Qatar"),
             p("Intended Major: CS"),
             p("Sai, sophomore pre CS student, who was born in Hyderabad, 
                India but raised in Doha, Qatar. Some of 
                his personal loves in life are the Naruto
                and the TV show, Suits. His interests are really wide from simulating consciousness,
                algae to solve the worlds problems or become really hyped about the financial services industry.
               On his time away from school work, he is either reading news or grabbing matcha ice cream.."),
             h2("Daniel Zhang"),
             p("Hometown : Shenzen, China"),
             p("Intended Major: Info"),
             p("Daniel, sophomore pre info student, from Shenzen. He is intrested in anime and history of Europe
               (especially in myth and legends). His current goals is to discover something he can devote to"),
             h2("Jesse Flores"),
             p("Hometown : Mount Vernon, WA"),
             p("Double Major: Geography ,  Earth and Space Sciences"),
             p("Jesse, sophomore from Mt Vernon. Feel free to Ask Jesse about global health and health
                disparities. Hobbies include drawing nature and his current goals are to travel, and make
                a positive impact on low income, low resource communities."),
             h2("Yueh"),
             p("Hometown : Taiwan"),
             p("Major: Info"),
             p("")
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
             p("How does the game change over time ? Slide the slider to find out where the most intense action was!"),
             absolutePanel(id = "controls", class = "panel panel-default", fixed = TRUE,
                           draggable = TRUE, top = 60, left = "auto", right = 20, bottom = "auto",
                           width = 330, height = "auto",
                           
                           sliderInput(inputId = "time_passed",
                                       label = "Number of minutes passed",
                                       min = 0, max = 40, value = 0)
                           
                      
                           ),
               
              
                 plotOutput("death_plot", height = 900, width =1300)
             )
  ),
  tabPanel("Find your victims and killers",
           tags$div(
             p("Cheat code for statistically knowing where your victim or killer is ? Select the option to find out and win!"),
             absolutePanel(id = "controls", class = "panel panel-default", fixed = TRUE,
                           draggable = TRUE, top = 60, left = "auto", right = 20, bottom = "auto",
                           width = 330, height = "auto",
                           selectInput("kvmap", "Select an option", c("Kiler", "Victims")),
                           sliderInput(inputId = "Xcordinate",
                                       label = "Select a x cordinate",
                                       min = 0, max = 800000, value = 0),
                           sliderInput(inputId = "Ycordinate",
                                       label = "Select a y cordinate",
                                       min = 0, max = 800000, value = 0)
                           
                           
             ),
             
             plotOutput("victim_killer_plot", height = 900, width =1300)
           )
  )
    
))
