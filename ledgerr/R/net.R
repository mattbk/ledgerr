#' Calculate net 
#' 
#' This function reads in your journal, subsets it according to queries, and calculates net.
#' @param journ Journal dataframe
#' @param classselect Which classes to include. c("class1","class2",...). Defaults to "all".
#' @param accselect Which accounts to include. c("class1","class2",...). Defaults to "all".
#' @param dates Date range to include. c("2014-01-01","2014-12-31"). Defaults to "all".
#' @keywords net
#' @export
#' @examples
#' net()
net<-function(journ,
              classselect="all",
              accselect="all",
              dates="all"){
  if("all" %in% classselect) {
    classselect<-levels(journ$Class)
  }
  if("all" %in% accselect) {
    accselect<-levels(journ$Account)
  }  
  if("all" %in% dates) {
    dates<-c(min(journ$Date),max(journ$Date))
  }
  net<-sum(journ$Credit[journ$Class %in% classselect & journ$Account %in% accselect & journ$Date>=dates[1] & journ$Date<=dates[2]],
           na.rm=T)-sum(journ$Debit[journ$Class %in% classselect & journ$Account %in% accselect & journ$Date>=dates[1] & journ$Date<=dates[2]],
                        na.rm=T)
  return(net)
}