net.class<-function(journ,
                    classselect="all",
                    accselect="all",
                    dates="all",
                    total=F) {
  # List of classes
  if("all" %in% classselect) {
    classselect<-levels(journ$Class)
  }
  # Set up data frame
  net.class.out<-data.frame(Class=character(),
                            Net=numeric(),
                            stringsAsFactors=FALSE)
  # Loop through classes, calculate net, and add to data frame
  for (i in 1:length(classselect)) {
    net.class.out[i,] <- c(classselect[i],
                           net(journ,
                               classselect=classselect[i],
                               accselect=accselect,
                               dates="all"))
  }
  # Add total net row
  if(total) {
    net.class.out[nrow(net.class.out)+1,]<-c("Total",net(journal))
  }
  return(net.class.out)
}