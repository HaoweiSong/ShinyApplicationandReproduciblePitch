library(shiny)
shinyUI(fluidPage(

    # Application title
    titlePanel("Old Faithful Geyser Eruption Prediction"),

    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
            sliderInput("waiting",
                        "Waiting time (min)",
                        min = 45,
                        max = 95,
                        value = 80)
        ),

        # Show a plot of the generated distribution
        mainPanel(
            plotOutput("predictionPlot"),
            h3("Predicted Eruption Time(min):"),
            textOutput("pred")
        )
    )
))
