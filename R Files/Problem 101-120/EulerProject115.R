countPossibilities <- function(totalLength, minLength){
  possibilities <- rep(0, totalLength)
  possibilities[minLength] <- 1
  possibilities[minLength + 1] <- 2
  for(i in (minLength + 2):totalLength){
    totalSum <- 0
    for(j in minLength:i){
      totalSum <- totalSum + 1 + sum(possibilities[1:max(i-j-1,1)])
    }
    possibilities[i] <- totalSum 
  }
  return (sum(possibilities))
}

minimumLength <- 50
for(segmentLength in 4:1000){
  if(countPossibilities(segmentLength, minimumLength) + 1 > 1000000){
    print(segmentLength)
    break
  }
}