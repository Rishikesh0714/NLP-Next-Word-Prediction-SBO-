


library(shiny)
library(sbo)
library(dplyr)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
   
   load("Output/sbo_model.rda")
   nxtwords <- sbo_predictor(t)
   output$nxt <- renderPrint({predict(nxtwords, input$sentence)}) 
   
   load("Output/evaluate.rda")
   set.seed(840)
   #evaluations <- eval_sbo_predictor(nxtwords, test = test)
   output$evaluation <- renderDataTable({
      head(evaluation)
   })
   
   output$accuracy <- renderTable({
      evaluation %>% summarise(accuracy = sum(correct)/n(),
                                uncertainty = sqrt(accuracy * (1 - accuracy) / n()))
      
   })
   
   load("Output/time.rda")
   output$time1 <- renderPrint({total})
})

