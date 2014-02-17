extendedEuclidean <- function(a, b){
  s <- 0
  t <- 1
  r <- b
  old_s <- 1
  old_t <- 0
  old_r <- a
  while(r != 0){
    quotient <- floor(old_r / r)
    temp <- r
    r <- old_r - quotient * temp
    old_r <- temp
    temp <- s
    s <- old_s - quotient * temp
    old_s <- temp
    temp <- t
    t <- old_t - quotient * temp
    old_t <- temp
  }
  return (old_s)
}

max <- 1000003
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
primes <- primes[primes >= 5]

total <- 0
for(i in 1:(length(primes) - 1)){
  p1 <- primes[i]
  p2 <- primes[i + 1]
  modTerm <- 10^(floor(log10(p1)) + 1)
  inverse <- extendedEuclidean(p2, modTerm)
  total <- total + (((p1 * inverse) %% modTerm)*p2)
  total <- total %% 10000 # to get the last couple of digits correct since R has a lack of precision
}
print (total)
