counter <- 1
primes <- c(2)

while(TRUE){
  if((counter %% 2 == 1) & (2*counter %% primes[counter]) >= (10^10/primes[counter])){
    print(counter)
    break
  }
  start <- primes[length(primes)] + 1
  while(TRUE){
    isPrime <- TRUE
    for(i in 1:length(primes)){
      if(start %% primes[i] == 0){
        isPrime <- FALSE
        break
      }
    }
    if(isPrime){
      primes <- c(primes, start)
      counter <- counter + 1
      break
    }
    start <- start + 1
  }
}
