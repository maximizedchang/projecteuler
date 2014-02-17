extendedGCD <- function(a, b){
  if(max(a, b) %% min(a, b) == 0){
    return (1)
  }
  if(a %% 2 == 0 & b %% 2 == 0){
    return (1)
  }
  if(a %% 3 == 0 & b %% 3 == 0){
    return (1)
  }
  if(a %% 5 == 0 & b %% 5 == 0){
    return (1)
  }
  if(a %% 7 == 0 & b %% 7 == 0){
    return (1)
  }
  s <- 0
  t <- 1
  r <- b
  old_s <- 1
  old_t <- 0
  old_r <- a
  while(r != 0){
    quotient <- floor(old_r/r)
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
  if(old_r != 1){
    return (1)
  }
  return (old_s)
}

l <- function(n){
  for(m in (n - 2):1){
    if(m >= n/2){
      modifiedm <- n - m
    } else {
      modifiedm <- m
    }
    if((extendedGCD(modifiedm, n) - m) %% n == 0){
      return (m)
    }
  }
}

sum <- 0
for(n in 3:(2*10^7)){
  sum <- sum + l(n)
  
}