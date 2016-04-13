net.acc<-function(journ,
                  classselect="all",
                  accselect="all",
                  dates="all",
                  total=F) {
  # List of classes - need to do this here before passing to net()
  if("all" %in% accselect) {
    accselect<-unique(journ$Account)
  }
  # Set up data frame
  net.acc.out<-data.frame(Account=character(),
                          Net=numeric(),
                          stringsAsFactors=FALSE)
  # Loop through accounts, calculate net, and add to data frame
  for (i in 1:length(accselect)) {
    net.acc.out[i,] <- c(as.character(accselect[i]),
                         net(journ,
                             classselect=classselect,
                             accselect=accselect[i],
                             dates=dates))
  }
  # Sort by account name
  net.acc.out<-net.acc.out[order(net.acc.out$Account) , ]
  # Add total net row
  if(total) {
    net.acc.out[nrow(net.acc.out)+1,]<-c("Total",net(journal))
  }
  return(net.acc.out)
}