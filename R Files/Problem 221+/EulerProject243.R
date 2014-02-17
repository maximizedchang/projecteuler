generatePrimes <- function(targetValue){
  primes <- c(2)
  while(TRUE){
    value <- prod(primes)/(prod(primes) - 1)
    for(i in 1:length(primes)){
      value <- value * (1 - 1/primes[i])
    }
    if(value < targetValue){
      return (primes)
    }
    startingValue <- primes[length(primes)] + 1
    while(TRUE){
      isPrime <- TRUE
      for(i in 1:length(primes)){
        if(startingValue %% primes[i] == 0){
          isPrime <- FALSE
          break
        }
      }
      if(isPrime){
        primes <- c(primes, startingValue)
        break
      }
      startingValue <- startingValue + 1
    }
  }
}
target <- 15499/94744
listOfPrimes <- generatePrimes(target)
minValue <- prod(listOfPrimes)
for(i in 1:length(listOfPrimes)){
  if(prod((listOfPrimes[1:i]-1))/prod(listOfPrimes[1:i]) >= target){
    next
  }
  possibleValue <- ceiling(1/(prod(listOfPrimes[1:i]) - prod((listOfPrimes[1:i] - 1))/target))
  if(possibleValue*prod(listOfPrimes[1:i])  < minValue){
    minValue <- possibleValue*prod(listOfPrimes[1:i])
  }
}
print (minValue)