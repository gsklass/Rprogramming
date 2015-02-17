pollutantmean <- function(directory, pollutant, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'pollutant' is a character vector of length 1 indicating
  ## the name of the pollutant for which we will calculate the
  ## mean; either "sulfate" or "nitrate".
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return the mean of the pollutant across all monitors list
  ## in the 'id' vector (ignoring NA values)
  valCnt <- 0
  valSum <- 0
  for (monID in id){
    file<-sprintf("%s%s%s%03d%s","~/",directory,"/",monID,".csv")
    #print(file)
    data<-read.csv(file)
    pvals<-data[pollutant]
    gdVals<-pvals[!is.na(pvals)]
    valCnt <- valCnt + length(gdVals)
    valSum <- valSum + sum(gdVals)
  }
  if (valCnt>0)
    valSum/valCnt
  else 
    0
}

complete <- function(directory, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return a data frame of the form:
  ## id nobs
  ## 1  117
  ## 2  1041
  ## ...
  ## where 'id' is the monitor ID number and 'nobs' is the
  ## number of complete cases

  nobs<-1:length(id)
  numData <- 1
  for (monID in id){
    file<-sprintf("%s%s%s%03d%s","~/",directory,"/",monID,".csv")
    data<-read.csv(file)
    goodDataCount <- 0
    for (rNum in 1:nrow(data)){
      s<-data[rNum,"sulfate"]
      n<-data[rNum,"nitrate"]
      if (!(is.na(s) || is.na(n))){
        goodDataCount <- goodDataCount + 1
      }
    }
    nobs[numData]<-goodDataCount
    numData<-numData+1
  }
  cbind(id,nobs)
}

