#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#

library(shiny)

# Use https://github.com/maxconway/gsheet
library(gsheet)

# Use the functions in ledgerr (the package that is part of this project) but don't load the package itself--this will let us deploy to Shiny.io more easily.
library(R.utils) #for sourceDirectory()
sourceDirectory("ledgerr/R")

# Pull Google sheet locations from another file (journal1, journal2, etc.)
source("config.R")

# Combine bank accounts
journal<-rbind(journal1,journal2)

## Clean up
# Date is date
journal$Date<-as.Date(journal$Date,format="%m/%d/%Y")
# Replace empty classes and accounrs
journal$Class[journal$Class==""]<-c("unclassified")
journal$Account[journal$Account==""]<-c("unclassified")
# Class, Accounts are factors
journal$Class<-as.factor(journal$Class)
journal$Account<-as.factor(journal$Account)
# Empty class should be NA
# Debit and Credit are numeric, without commas
journal$Debit<-as.numeric(sub(",","",journal$Debit))
journal$Credit<-as.numeric(sub(",","",journal$Credit))






# Define server logic required to draw a histogram
shinyServer(function(input, output) {
   
  output$distPlot <- renderPlot({
    
    # generate bins based on input$bins from ui.R
    x    <- faithful[, 2] 
    bins <- seq(min(x), max(x), length.out = input$bins + 1)
    
    # draw the histogram with the specified number of bins
    hist(x, breaks = bins, col = 'darkgray', border = 'white')
    
  })
  
  # Show journal
  output$mytable = renderDataTable({
    journal
  })
  
})
