max <- 10^8
primeBooleans <- rep(TRUE, max)
primeBooleans[1] <- FALSE
for(num in 2:max){
  if(!primeBooleans[num]){
    next
  }
  maxMultiplier <- floor(max/num)
  if(maxMultiplier != 1){
    primeBooleans[(2:maxMultiplier)*num] <- FALSE
  }
}
primes <- (1:max)[primeBooleans]

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