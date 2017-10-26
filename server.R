#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(plotly)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
   
  output$bvndPlot3D <- renderPlotly({
    
    mu1 = input$mu1
    mu2 = input$mu2
    s11 = input$s11
    s22 = input$s22
    rho = input$rho
    
    x1  = seq(-20, 20, length = 41)
    x2 = x1
    
    bvnd = function(x1, x2) {
      term1<-1 / (2 * pi * sqrt(s11 * s22 * (1 - rho ^ 2)))
      term2<--1 / (2*(1 - rho ^ 2))
      term3<-(x1 - mu1) ^ 2 / s11
      term4<-(x2 - mu2) ^ 2 / s22
      term5<--2 * rho * ((x1 - mu1) * (x2 - mu2)) / (sqrt(s11) * sqrt(s22))
      term1 * exp(term2 * (term3 + term4 - term5))
    }
    
    z = outer(x1, x2, bvnd)
    plot_ly(x = x1, y = x2, z = z) %>% add_surface()
  })

  output$bvndPlot2D <- renderPlotly({
    
    mu1 = input$mu1
    mu2 = input$mu2
    s11 = input$s11
    s22 = input$s22
    rho = input$rho
    
    x1  = seq(-20, 20, length = 41)
    x2 = x1
    
    bvnd = function(x1, x2) {
      term1<-1 / (2 * pi * sqrt(s11 * s22 * (1 - rho ^ 2)))
      term2<--1 / (2*(1 - rho ^ 2))
      term3<-(x1 - mu1) ^ 2 / s11
      term4<-(x2 - mu2) ^ 2 / s22
      term5<--2 * rho * ((x1 - mu1) * (x2 - mu2)) / (sqrt(s11) * sqrt(s22))
      term1 * exp(term2 * (term3 + term4 - term5))
    }
    
    z = outer(x1, x2, bvnd)
    plot_ly(z = z, type = "contour")
  })
  
  output$event <- renderPrint({
    d <- event_data("plotly_hover")
    if (is.null(d)) "Hover on a point!" else d
  })
  
})
