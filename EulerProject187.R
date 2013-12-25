# primes <- c(2)
# for(i in 3:50000000){
#   isPrime <- TRUE
#   for(j in 1:length(primes)){
#     if(primes[j] > sqrt(i)){
#       break
#     }
#     if(i %% primes[j] == 0){
#       isPrime <- FALSE
#       break
#     }
#   }
#   primes <- c(primes, i)
# }

maxNumber <- 50000000
primes <- 1:maxNumber
isPrime <- rep(FALSE, length(primes))
root <- floor(sqrt(maxNumber))
for(x in 1:root){
  for(y in 1:root){
    n <- 4*x^2 + y^2
    if(n <= maxNumber & (n %% 12 == 1 | n %% 12 == 5)){
      isPrime[n] <- !isPrime[n]
    }
    n <- 3*x^2 + y^2
    if(n <= maxNumber & n %% 12 == 7){
      isPrime[n] <- !isPrime[n]
    }
    if(x > y){
      n <- 3*x^2 - y^2
      if(n <= maxNumber & n %% 12 == 11){
        isPrime[n] <- !isPrime[n]
      }
    }
  }
}
for(n in 5:root){
  if(isPrime[n]){
    multiplier <- 1
    while(multiplier * n^2 <= maxNumber){
      isPrime[multiplier * n^2] <- FALSE
      multiplier <- multiplier + 1
    }
  }
}
isPrime[2] <- TRUE
isPrime[3] <- TRUE

countPossibilities <- function(factors, product){
  if(length(factors) == 0){
    return (1)
  }
  nextFactor <- factors[1]
  factors <- factors[-1]
  total <- 0
  while(product < 100000000){
    total <- total + countPossibilities(factors, product)
    if(product >= 100000000/nextFactor){
      break
    }
    product <- product * nextFactor
  }
  return (total)
}


finalPrimes <- (1:maxNumber)[isPrime]
count <- 0
for(i in 1:length(finalPrimes)){
  for(j in (i+1):length(finalPrimes)){
    if(100000000/finalPrimes[i] >= finalPrimes[j]){
      next
    } 
    start <- finalPrimes[i] * finalPrimes[j]
    count <- count + countPossibilities(c(finalPrimes[i], finalPrimes[j]), start)
  }
}

for(i in 1:length(finalPrimes)){
  if(100000000/finalPrimes[i] >= finalPrimes[i]){
    next  
  } 
  count <- count + countPossibilities(c(finalPrimes[i]), finalPrimes[i]^2)
}
print(count)