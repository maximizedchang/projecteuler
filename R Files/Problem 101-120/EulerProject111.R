sumPrimes <- function(n, d){
  foundAPrime <- FALSE
  for(i in n:1){
    possiblePrimes <- generateListOfPossiblePrimesWrapper(n, i, d)
    sumOfPrimes <- analyzeListOfPrimes(possiblePrimes)
    if(sumOfPrimes != 0){
      return (sumOfPrimes)
    }
  }
}

analyzeListOfPrimes <- function(primeList){
  sum <- 0
  for(i in 1:length(primeList)){
    if(isPrime(primeList[i])){
      sum <- sum + primeList[i]
    }
  }
  return (sum)
}

isPrime <- function(x){
  for(i in 2:floor(sqrt(x))){
    if(x %% i == 0){
      return (FALSE)
    }
  }
  return (TRUE)
}

generateListOfPossiblePrimesWrapper <- function(totalNumberOfDigits, numberOfRepeatedDigits, repeatedDigit){
  if(totalNumberOfDigits == numberOfRepeatedDigits){
    value <- 0
    for(i in 1:totalNumberOfDigits){
      value <- value*10 + repeatedDigit
    }
    return (c(value))
  }
  totalList <- c()
  for(firstDigit in 1:9){
    if(firstDigit == repeatedDigit){
      if(numberOfRepeatedDigits > 0){
        totalList <- c(totalList, generateListOfPossiblePrimes(totalNumberOfDigits - 1, numberOfRepeatedDigits - 1, repeatedDigit, firstDigit))
      }
    } else {
      totalList <- c(totalList, generateListOfPossiblePrimes(totalNumberOfDigits - 1, numberOfRepeatedDigits, repeatedDigit, firstDigit))
    }
  }
  return (totalList)
}

generateListOfPossiblePrimes <- function(remainingNumberOfDigits, remainingNumberOfRepeatedDigits, repeatedDigit, currentNumber){
  if(remainingNumberOfDigits == 0){
    return (c(currentNumber))
  }
  if(remainingNumberOfDigits == remainingNumberOfRepeatedDigits){
    for(i in 1:remainingNumberOfDigits){
      currentNumber <- currentNumber * 10 + repeatedDigit
    }
    return (c(currentNumber))
  }
  totalList <- c()
  for(nextDigit in 0:9){
    if(nextDigit == repeatedDigit){
      if(remainingNumberOfRepeatedDigits > 0){
        totalList <- c(totalList, generateListOfPossiblePrimes(remainingNumberOfDigits - 1, remainingNumberOfRepeatedDigits - 1, repeatedDigit, currentNumber * 10 + nextDigit))
      }
    } else {
      totalList <- c(totalList, generateListOfPossiblePrimes(remainingNumberOfDigits - 1, remainingNumberOfRepeatedDigits, repeatedDigit, currentNumber * 10 + nextDigit))
    }
  }
  return (totalList)
}

total <- 0
for(d in 0:9){
  total <- total + sumPrimes(10, d)
}
print (total)
