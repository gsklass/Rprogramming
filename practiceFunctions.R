add2 <-function(x,y){
  x+y
}

above10 <- function(x){
  use<-x>10
  x[use]
}

columnMean <-function(M, removeNA=TRUE){
  nCol<-ncol(M)
  means<-numeric(nCol)
  for (i in 1:nCol){
    means[i] <- mean(M[,i],na.rm=removeNA)
  }
  means
}
hello <- function(){
  print("Hello?")
}