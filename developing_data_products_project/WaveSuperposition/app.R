
library(shiny)

# Define UI for application 
ui <- fluidPage(
   
   # Application title
   titlePanel("Wave Superposition"),
   
   # Sidebar 
   sidebarLayout(
      sidebarPanel(
         sliderInput("amp_0.5",
                    "Amplitude of wavelength 0.5:",
                    min = -10,
                    max = 10,
                    value = 0),
         sliderInput("amp_1",
                     "Amplitude of wavelength 1:",
                     min = -10,
                     max = 10,
                     value = 10),
         sliderInput("amp_1.5",
                     "Amplitude of wavelength 1.5:",
                     min = -10,
                     max = 10,
                     value = 0),
         sliderInput("amp_2",
                     "Amplitude of wavelength 2:",
                     min = -10,
                     max = 10,
                     value = 10),
         sliderInput("amp_2.5",
                     "Amplitude of wavelength 2.5:",
                     min = -10,
                     max = 10,
                     value = 0),
         sliderInput("amp_3",
                     "Amplitude of wavelength 3:",
                     min = -10,
                     max = 10,
                     value = 0)
      ),

      # Show a plot 
      mainPanel(
         plotOutput("allPlot")
      )
   )
)

# Define server logic required 
server <- function(input, output) {
   
   output$allPlot <- renderPlot({

      X <- seq(0,6,0.01)
      unit_f <- function(x,wavelength,amp) {
        amp*sin(2*pi*x/wavelength)
      }
      f <- function(x){ 
          unit_f(x,0.5,input$amp_0.5) + unit_f(x,1.0,input$amp_1) +
          unit_f(x,1.5,input$amp_1.5) + unit_f(x,2.0,input$amp_2) +
          unit_f(x,2.5,input$amp_2.5) + unit_f(x,3.0,input$amp_3) 
      }
      
      plot(X,f(X),type='l',col='black',lwd=4)
      lines(X,unit_f(X,0.5,input$amp_0.5),type='l',col='blue',lwd=2)
      lines(X,unit_f(X,1.0,input$amp_1),type='l',col='orange',lwd=2) 
      lines(X,unit_f(X,1.5,input$amp_1.5),type='l',col='red',lwd=2)
      lines(X,unit_f(X,2.0,input$amp_2),type='l',col='green',lwd=2)  
      lines(X,unit_f(X,2.5,input$amp_2.5),type='l',col='purple',lwd=2)
      lines(X,unit_f(X,3.0,input$amp_3),type='l',col='brown',lwd=2) 
   })
}

# Run the application 
shinyApp(ui = ui, server = server)

