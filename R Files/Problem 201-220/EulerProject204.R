type <- 100
max <- 1000000000

primes <- c(2)
for(i in 3:type){
  for(j in 1:length(primes)){
    isPrime <- TRUE
    if(i %% primes[j] == 0){
      isPrime <- FALSE
      break
    }
  }
  if(isPrime){
    primes <- c(primes, i)
  }
}

generateHammingNumbers <- function(remainingPrimes, currentValue){
  if(length(remainingPrimes) == 0){
    return (1)
  }
  total <- 0
  prime <- remainingPrimes[1]
  remainingPrimes <- remainingPrimes[-1]
  while(currentValue <= max){
    total <- total + generateHammingNumbers(remainingPrimes, currentValue)
    currentValue <- currentValue * prime
  }
  return (total)
}

print (generateHammingNumbers(primes, 1))