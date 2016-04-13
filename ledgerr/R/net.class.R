#' Calculate net per class and present as a table
#' 
#' This function reads in your journal, subsets it according to queries, calculates net for each class, and prints a table..
#' @param journ Journal dataframe
#' @param classselect Which classes to include. c("class1","class2",...). Defaults to "all".
#' @param accselect Which accounts to include. c("class1","class2",...). Defaults to "all".
#' @param dates Date range to include. c("2014-01-01","2014-12-31"). Defaults to "all".
#' @keywords net class
#' @export
#' @examples
#' net.class()
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