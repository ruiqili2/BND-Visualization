  #
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(plotly)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Bivariate Normal Distribution"),
  
  # Sidebar with a slider input for number of  
  sidebarLayout(
    sidebarPanel(
       sliderInput("mu1",
                   "mu1: ",
                   min = -20,
                   max = 20,
                   value = 0),
       
       sliderInput("mu2",
                   "mu2: ",
                   min = -20,
                   max = 20,
                   value = 0),
       
       sliderInput("s11",
                   "s11: ",
                   min = 0,
                   max = 20,
                   value = 10),
       
       sliderInput("s22",
                   "s22: ",
                   min = 0,
                   max = 20,
                   value = 10),
       
       sliderInput("s12",
                   "s12: ",
                   min = 0,
                   max = 20,
                   value = 10),
       
       sliderInput("rho",
                   "rho: ",
                   min = 0,
                   max = 1,
                   value = 0.5)
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
       plotlyOutput('bndPlot'),
       verbatimTextOutput("event")
    )
  )
))
