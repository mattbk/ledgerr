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