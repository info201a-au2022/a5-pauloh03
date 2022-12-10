library(tidyverse)
library(dplyr)
library(ggplot2)
library(stringr)
library(plotly)

# data sourcing
co2_data <- read.csv("../data/owid-co2-data.csv")
View(co2_data)

us_co2_data <- co2_data %>% 
  select(country, year, iso_code, population, gdp, gas_co2, cement_co2,
         coal_co2, flaring_co2, oil_co2, trade_co2) %>% 
  na.omit() %>% 
  filter(country == "United States")

View(us_co2_data)

# introduction part ------------------------------------------------------
 # general US data knowledge

us_gen_knowledge <- list()

us_gen_knowledge$rows <- nrow(us_co2_data)
us_gen_knowledge$columns <- ncol(us_co2_data)
us_gen_knowledge$pop_min <- min(us_co2_data$population)
us_gen_knowledge$pop_max <- max(us_co2_data$population)
us_gen_knowledge$pop_mean <- mean(us_co2_data$population)
us_gen_knowledge$gdp_min <- min(us_co2_data$gdp)
us_gen_knowledge$gdp_max <- max(us_co2_data$gdp)
us_gen_knowledge$gdp_mean <- mean(us_co2_data$gdp)
us_gen_knowledge$gas_min <- min(us_co2_data$gas_co2)
us_gen_knowledge$gas_max <- max(us_co2_data$gas_co2)
us_gen_knowledge$gas_mean <- mean(us_co2_data$gas_co2)
us_gen_knowledge$cement_min <- min(us_co2_data$cement_co2)
us_gen_knowledge$cement_max <- max(us_co2_data$cement_co2)
us_gen_knowledge$cement_mean <- mean(us_co2_data$cement_co2)
us_gen_knowledge$coal_min <- min(us_co2_data$coal_co2)
us_gen_knowledge$coal_max <- max(us_co2_data$coal_co2)
us_gen_knowledge$coal_mean <- mean(us_co2_data$coal_co2)
us_gen_knowledge$flaring_min <- min(us_co2_data$flaring_co2)
us_gen_knowledge$flaring_max <- max(us_co2_data$flaring_co2)
us_gen_knowledge$flaring_mean <- mean(us_co2_data$flaring_co2)
us_gen_knowledge$oil_min <- min(us_co2_data$oil_co2)
us_gen_knowledge$oil_max <- max(us_co2_data$oil_co2)
us_gen_knowledge$oil_mean <- mean(us_co2_data$oil_co2)
us_gen_knowledge$trade_min <- min(us_co2_data$trade_co2)
us_gen_knowledge$trade_max <- max(us_co2_data$trade_co2)
us_gen_knowledge$trade_mean <- mean(us_co2_data$trade_co2)

server<- function(input, output) {
  output$data_plot <- renderPlotly({

    
    plotting <- ggplot(us_co2_data, aes(
      x = year,
      y = gas_co2
    )) + geom_line(aes()) + 
      scale_y_continuous(labels = scales::comma) +
      labs(
        x = "Year",
        y = "Gas CO2 Emissions by the million tonnes") +
      xlim(input$year_select)
    
    ggplotly(plotting)

    
  })
    
}