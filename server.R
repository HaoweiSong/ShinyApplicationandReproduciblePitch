
library(shiny)
shinyServer(function(input, output) {

    data(faithful); set.seed(333)
    lm1 <- lm(eruptions ~ waiting,data=faithful)


    output$predictionPlot <- renderPlot({

        plot(faithful$waiting,faithful$eruptions,pch=19,col="blue",xlab="Waiting",ylab="Duration")
        abline(lm1, col="green",lwd=4)

        # get the waiting time from the slide bar
        x<- input$waiting
        y<-coef(lm1)[1] + coef(lm1)[2]*x
        # draw line on the lenear regression fit line and report the predicted duration
        abline(v=x);abline(h=y)

    })

    output$pred <- renderText({
        coef(lm1)[1] + coef(lm1)[2]*input$waiting
    })
}
)

