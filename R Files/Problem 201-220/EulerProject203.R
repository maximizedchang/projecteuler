isSquareFree <- function(x){
  possibleSquareFactors <- (2:(floor(sqrt(x))))^2
  for(i in 1:length(possibleSquareFactors)){
    if(x %% possibleSquareFactors[i] == 0){
      return (FALSE)
    }
  }
  return (TRUE)
}

listOfSquareFreeBinCoeff <- c(1, 2, 3)
for(n in 0:50){
  for(k in 0:floor(n/2)){
    testNumber <- choose(n, k)
    if(testNumber > 4){
      if(isSquareFree(testNumber)){
        listOfSquareFreeBinCoeff <- c(listOfSquareFreeBinCoeff, testNumber)
      }
    }
  }
}

print (sum(unique(listOfSquareFreeBinCoeff)))