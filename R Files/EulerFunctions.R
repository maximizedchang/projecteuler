# Returns three values
# old_r : the gcd of a and b
# old_s : the modular multiplicative inverse of a (mod b)
# old_t : the modular multiplicative inverse of b (mod a)
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
  return (c(old_r, old_s, old_t))
}

# Returns a vector containing the factors of x (with repeats)
factor <- function(x){
  factors <- c()
  for(i in 2:max(2,floor(sqrt(x)))){
    while(x %% i == 0){
      factors <- c(factors, i)
      x <- x/i
    }
  }
  if(x != 1){
    factors <- c(factors, x)
  }
  return (factors)
}

# Returns TRUE if x is prime and FALSE otherwise
isPrime <- function(x){
  if(x == 1){ 
    return (FALSE)
  }
  for(i in 2:floor(sqrt(x))){
    if(x %% i == 0){
      return (FALSE)
    }
  }
  return (TRUE)
}

# Returns TRUE if num/denom is a terminating decimal and FALSE otherwise
determineIfTerminating <- function(num, denom){
  while(denom %% 8 == 0){
    denom <- denom / 8
  }
  while(denom %% 2 == 0){
    denom <- denom / 2
  }
  while(denom %% 25 == 0){
    denom <- denom / 25
  }
  if(denom %% 5 == 0){
    denom <- denom / 5
  }
  return ((num %% denom) == 0)
}

# Returns a vector with all primes between min and max inclusive
generatePrimes <- function(min, max){
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
  primes <- primes[primes >= min]
}

# Returns the totient of n (number of numbers less than n that are coprime with n)
totient <- function(n){
  uniqueFactors <- unique(factor(n))
  totientResult <- n
  for(i in 1:length(uniqueFactors)){
    totientResult <- totientResult * (uniqueFactors[i] - 1)/(uniqueFactors[i])
  }
  return (totientResult)
}