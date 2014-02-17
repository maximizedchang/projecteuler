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

D <- function(N, lastMaxk){
  maxk <- 1
  maxP <- 0
  for(k in lastMaxk:(lastMaxk + 1)){
    if(k*log(N/k) > maxP){
      maxP <- k * log(N/k)
      maxk <- k
    }
  }
  if(determineIfTerminating(N, maxk)){
    return (c(-1 * N, maxk))
  } else {
    return (c(N, maxk))
  }
}
max <- 10000
min <- 5
sum <- 0
lastMaxk <- 2
for(N in min:max){
  DValue <- D(N, lastMaxk)
  sum <- sum + DValue[1]
  lastMaxk <- DValue[2]
}
print (sum)