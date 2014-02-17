countPossibilities <- function(totalLength, minLength){
  possibilities <- rep(0, totalLength)
  possibilities[3] <- 1
  possibilities[4] <- 2
  for(i in 5:totalLength){
    totalSum <- 0
    for(j in minLength:i){
      totalSum <- totalSum + 1 + sum(possibilities[1:max(i-j-1,1)])
    }
    possibilities[i] <- totalSum 
  }
  return (sum(possibilities))
}

segmentLength <- 50
print(countPossibilities(segmentLength, 3) + 1)