library(shiny)
library(tidyverse)
library(plotly)
library(shinythemes)

# intro page ----------------------------------------------------------
intro_main_content <- mainPanel(
  h1("Introduction"),
  p("As Carbon Dioxide emissions have been a big conversation around the world
    for quite some time, it is important to be aware of what is going on.
    Focusing on the United States,", em("gas"), "has been in demand for a long
    time now and has come back into the discussion as gas prices have risen once
    again."),
  
  h2(strong("The Data")),
  p("Within 1990 and 2018, the maximum population of the United States within a
    given year has been", em("332,140,032"), "people, with the minimum being",
    em("248,083,278"), "people. In fact, the population has been steadily growing,
    and CO2 emission rates have grown alongside it. The maximum amount of CO2
    emissions from gas was", em("1,618.72 million tonnes"), "while the minimum was",
    em("1,023.458 million tonnes."), "This graph serves to show the growth of gas
    CO2 emissions as the population has increased.")
  )
  
intro_panel <- tabPanel(
  "Intro Page",
  
  titlePanel("Intro"),
  
  intro_main_content
)
  
# data visualization page ---------------------------------------------
data_sidebar_content <- sidebarPanel(
  
  sliderInput(
    inputId = "year_select",
    label = "Selected Years",
    min = 1990,
    max = 2018,
    value = c(1990, 2018),
    sep = ""
  )
)

data_main_content <- mainPanel(
  plotlyOutput(outputId = "data_plot"))

data_panel <- tabPanel(
  "Data Page",
  
  titlePanel("something"),
  
  data_sidebar_content,
  
  data_main_content
)


# ui ------------------------------------------------------------------
ui<- fluidPage(
  theme = shinytheme("flatly"),
  navbarPage("CO2 Data", intro_panel, data_panel)
)