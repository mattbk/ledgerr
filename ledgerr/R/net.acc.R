#' Calculate net per account and present as a table
#' 
#' This function reads in your journal, subsets it according to queries, calculates net for each account, and prints a table..
#' @param journ Journal dataframe
#' @param classselect Which classes to include. c("class1","class2",...). Defaults to "all".
#' @param accselect Which accounts to include. c("class1","class2",...). Defaults to "all".
#' @param dates Date range to include. c("2014-01-01","2014-12-31"). Defaults to "all".
#' @keywords net account
#' @export
#' @examples
#' net.account()
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