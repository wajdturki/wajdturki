ax = dataBR.plot(x="country name", y="GDP", legend=False, label='saudi Arabia GDP', color='#E75519', linewidth = 3)
ax.ticklabel_format(useOffset=False, style='plain')
ax2 = ax.twinx()
Petroleum.plot(x="country name", y="GDP",ax=ax2, legend=False, label='Total GDP', color='#82AE47', linewidth = 1)
ax.figure.legend(loc='center left', bbox_to_anchor=(1.0, 0.5))
plt.show()

#I create plot for KSA GDP, and Comparison with TOTAL GDP

----------------------------------------------

plot_ly(data = wh15_17, 

        x=~Economy_GDP, y=~Happiness_Score, color=~Health, type = "scatter",

        text = ~paste("Country:", Country)) %>% 

        layout(title = "Happiness, GDP and Health relationship", 

               xaxis = list(title = "GDP per Capita"),

               yaxis = list(title = "Happiness Score"))
               
----------------------------------------------------



# the Title :

sidebarPanel("Compare Total GDP per Capita and GDP  between  countries over the years by selecting the Country to be compared",
                 hr(),
                             
radioButtons("variable_from_happiness",
label = h5("Compare:"),
  choices = c("country_name" = "saudi Arabia",
  "country_name" = "Bahrain",
  "country_name" = "United Arab Emirates",
  "country_name" = "Kuwait",
    "country_name" = "Egypt",

# we want Sum of GDP i will continue it.
# then we should choose country that what we want see GDP for it, then compire with TOTAL GDP :

                 uiOutput("choose_country"),
                 hr(),
                 uiOutput("choose_country_2"),
                 hr(),
                  sliderInput("Perceptions_of_corruption",
                             label = h5("Perceptions of corruption:"),
                             min = 0.08,
                             max = 0.94,
                             value = c(0.08, 0.94), 
                             format = "####", 
                             step = 5)
                               ),
                               
                               
                               server <- (function(input, output){
    
    # Create drop-down selection for country generated from happiness dataset
    output$choose_country <- renderUI({
      selectInput("country_from_happiness",
                  h5("First country:"),
                  levels(gDat$country),
                  selected = "Bahrin")
    })
    
    # Create drop-down selection for a 2nd country
    # Exclude "country_from_happiness" as an option
    output$choose_country_2 <- renderUI({
      selectInput("country_2_from_happiness",
                  h5("Second country:"),
                  levels(gDat$country)[levels(gDat$country) != 
                                         input$country_from_happiness],
                  selected = "Egypt")
    })
    
    
    # then go to create reactive:
    
        GDP_country_data <- reactive({
        
      if(is.null(input$country_from_happiness)){
        return(NULL)
      }
      
      if(is.null(input$country_2_from_happiness)){
        return(NULL)
      }
      
      gDat %>%
        select(country,Perceptions_of_corruption, GDP 
