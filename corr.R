corr <- function(directory, threshold = 0) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
  
  ## Return a numeric vector of correlations

  compList<-complete(directory)
  allCData<-vector()
  for(i in 1:nrow(compList)){
    #print(compList[i,"nobs"])
    if (compList[i,"nobs"] > threshold){
      file<-sprintf("%s%s%s%03d%s","~/",directory,"/",compList[i,1],".csv")
      #print(file)
      fileData <-read.csv(file)
      
      sData <- fileData["sulfate"]
      nData <- fileData["nitrate"]

      #isBad <- is.na(sData+nData)
      
      #sData <-sData[!isBad]
      #nData <-nData[!isBad]

      allCData<-c(allCData,cor(sData,nData,use="p"))
      #print(allCData)
      #print(cor(as.numeric(sData),as.numeric(nData),use="p"))
      
    }
  }
  allCData
}


