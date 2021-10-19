
library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
    
    # Application title
    titlePanel("Next Word Pediction (SBO)"),
    
    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
            textInput("sentence",
                      "Enter the text",
                      "My name "),
            h4("Backoff means you go back to a n-1 gram level to calculate the probabilities when you encounter a word with prob=0. "),
            br(), 
            h2("Instructions:"),
            tags$ol(
                tags$li("Enter a phrase in the text box."),
                tags$li("Probable predicted next words  prints below."),
                tags$li("<EOS> means End Of Sentence and <UNK> is  Unknown Words."),
                tags$li("Additional tabs show Evalution on Test set and its accuaracy")
            ),
            br(),
            h2("Links:"),
            h4("All code can be located on GitHub at:"),
            h5(a("https://github.com/Rishikesh0714/NLP-Next-Word-Prediction-SBO-"))
        ),
        
        # Show a plot of the generated distribution
        mainPanel(
            h2("Predicted Words:"),
            verbatimTextOutput('nxt'),
            
            br(),
            verbatimTextOutput('info'),
            
            h4("This APP generates four predicted next words based on the text you input. 
               The prediction algorithm relies on word frequencies in the English twitter, 
               blogs, and news datasets at:"),
            h6(a("https://d396qusza40orc.cloudfront.net/dsscapstone/dataset/Coursera-SwiftKey.zip")),
            
            br(),
            h4("Created  as part of my Captsone project for the 
            Data Science Specialization provided by Johns Hopkins University and Coursera."),
            br(),
            
            h2("Evaluation on Test Set"),
            dataTableOutput("evaluation"),
            
            h2("Model Accuracy"),
            tableOutput("accuracy"),
            br(),
            
            h2("Run Time"),
            h4("Model Run time (sbo_predtable):"),
            verbatimTextOutput("time1"),
            
            
        )
    )
))
